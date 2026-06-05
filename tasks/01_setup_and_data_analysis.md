# Task 01: Setup & Data Analysis

**Goal:** Finalize the enterprise database schema and initialize the Supabase backend.

## Sub-tasks
- [x] **Data Mapping:**
  - Read `/po_samples/PO-SPAE-003382127 - Bella FOC.xlsx`.
  - **Methodology:** Utilized `npx xlsx-cli` to extract column headers. A permanent, reusable CLI wrapper is saved at `scripts/preview_excel.sh` for future reference.
  - **Extracted Mapping:** 
    - `PO Number (FOC)` -> `purchase_orders.po_number`
    - `Search name` -> `products.sku` (The primary scannable identifier)
    - `Product name` -> `products.name`
    - `Quantity` -> `po_items.expected_quantity`
- [ ] **Supabase Initialization:**
  - Create the Supabase project.
  - Setup Authentication with `manager`, `supervisor`, and `worker` roles.
  - Setup Storage buckets: `discrepancy_photos` and `grn_documents`.
- [ ] **Database Schema Execution:**
  - Write and execute SQL scripts to create tables: `users`, `suppliers`, `products`, `locations`, `purchase_orders`, `po_items`, `shipments`, `scan_logs`, `discrepancies`, and `goods_received_notes`.
  - Configure Real-time subscriptions for dashboard monitoring.
  - Setup Row Level Security (RLS) to enforce role-based access.
