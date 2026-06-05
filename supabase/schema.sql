-- Enable UUID extension
create extension if not exists "uuid-ossp";

-- 1. Users table (Extending Supabase Auth)
create table public.user_roles (
  id uuid references auth.users on delete cascade primary key,
  email text not null,
  display_name text,
  role text check (role in ('manager', 'supervisor', 'worker')) not null,
  status text check (status in ('active', 'inactive', 'offline')) default 'active',
  last_login timestamp with time zone
);

-- 2. Suppliers
create table public.suppliers (
  id uuid primary key default uuid_generate_v4(),
  name text not null,
  contact_info text,
  erp_vendor_id text
);

-- 3. Products Master (SKU Catalog)
create table public.products (
  id uuid primary key default uuid_generate_v4(),
  sku text not null unique, -- This maps to "Search name" in the Excel file
  barcode text, 
  name text not null, -- Maps to "Product name"
  category text, -- Maps to "Procurement category"
  unit text, -- Maps to "Unit"
  requires_lot boolean default false,
  requires_serial boolean default false,
  requires_expiry boolean default false
);

-- 4. Locations (Bins)
create table public.locations (
  id uuid primary key default uuid_generate_v4(),
  zone text not null,
  aisle text,
  bin text not null,
  barcode text unique not null
);

-- 5. Purchase Orders
create table public.purchase_orders (
  id uuid primary key default uuid_generate_v4(),
  po_number text not null unique, -- Maps to "PO Number (FOC)"
  supplier_id uuid references public.suppliers,
  status text check (status in ('pending', 'in_progress', 'completed')) default 'pending',
  blind_receiving boolean default false,
  created_at timestamp with time zone default timezone('utc'::text, now())
);

-- 6. PO Items
create table public.po_items (
  id uuid primary key default uuid_generate_v4(),
  po_id uuid references public.purchase_orders on delete cascade not null,
  product_id uuid references public.products not null,
  line_number integer, -- Maps to "Line number"
  expected_quantity integer not null, -- Maps to "Quantity"
  received_quantity integer default 0
);

-- 7. Shipments (Deliveries)
create table public.shipments (
  id uuid primary key default uuid_generate_v4(),
  po_id uuid references public.purchase_orders on delete cascade not null,
  carrier_name text,
  tracking_number text,
  dock_door text,
  status text check (status in ('arrived', 'unloading', 'completed')) default 'arrived',
  arrival_time timestamp with time zone default timezone('utc'::text, now())
);

-- 8. Scan Logs
create table public.scan_logs (
  id uuid primary key default uuid_generate_v4(),
  shipment_id uuid references public.shipments not null,
  po_item_id uuid references public.po_items not null,
  user_id uuid references auth.users not null,
  quantity integer not null default 1,
  lot_number text,
  serial_number text,
  expiry_date date,
  location_id uuid references public.locations,
  scanned_at timestamp with time zone default timezone('utc'::text, now())
);

-- 8.5 Receiving Sessions
create table public.receiving_sessions (
  id uuid primary key default uuid_generate_v4(),
  session_number text not null unique,
  shipment_id uuid references public.shipments,
  po_id uuid references public.purchase_orders,
  operator_id uuid references public.user_roles(id),
  total_expected integer default 0,
  total_scanned integer default 0,
  discrepancies integer default 0,
  status text check (status in ('active', 'paused', 'completed', 'completed_with_errors')) default 'active',
  start_time timestamp with time zone default timezone('utc'::text, now()),
  end_time timestamp with time zone
);

-- 9. Discrepancies
create table public.discrepancies (
  id uuid primary key default uuid_generate_v4(),
  shipment_id uuid references public.shipments not null,
  po_item_id uuid references public.po_items not null,
  user_id uuid references auth.users not null,
  issue_type text check (issue_type in ('damaged', 'missing', 'wrong_item', 'short')) not null,
  photo_url text,
  notes text,
  status text check (status in ('pending_review', 'resolved')) default 'pending_review',
  created_at timestamp with time zone default timezone('utc'::text, now())
);

-- 10. Goods Received Notes (GRN)
create table public.goods_received_notes (
  id uuid primary key default uuid_generate_v4(),
  shipment_id uuid references public.shipments not null,
  pdf_url text not null,
  synced_to_erp boolean default false,
  generated_at timestamp with time zone default timezone('utc'::text, now())
);

-- Setup Realtime
alter publication supabase_realtime add table po_items;
alter publication supabase_realtime add table shipments;
alter publication supabase_realtime add table scan_logs;

-- 11. Dashboard RPC
CREATE OR REPLACE FUNCTION get_dashboard_stats()
RETURNS json AS $$
DECLARE
  total_pos int;
  pending_shipments int;
  open_discrepancies int;
  active_suppliers int;
BEGIN
  -- Count total POs
  SELECT count(*) INTO total_pos FROM purchase_orders;
  
  -- Count pending shipments
  SELECT count(*) INTO pending_shipments FROM purchase_orders WHERE status = 'pending';
  
  -- Open discrepancies
  SELECT count(*) INTO open_discrepancies FROM discrepancies WHERE status = 'pending_review';
  
  -- Active suppliers
  SELECT count(*) INTO active_suppliers FROM suppliers;

  RETURN json_build_object(
    'total_pos', total_pos,
    'pending_shipments', pending_shipments,
    'open_discrepancies', open_discrepancies,
    'active_suppliers', active_suppliers
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
