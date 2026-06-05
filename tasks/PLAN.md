# Warehouse Receiving System - Implementation Plan

This document outlines the proposed technical implementation for a comprehensive, enterprise-grade Warehouse Receiving System based on the expanded requirements.

## Tech Stack: The Dart Ecosystem
- **Mobile Worker App:** **Flutter** - Native performance, cross-platform (iOS/Android), robust hardware integration (camera barcodes, external scanners), and camera integrations for discrepancy photo capture.
- **Web Manager Dashboard:** **Flutter Web** - Provides an identical widget tree and a massive ecosystem for data tables, charts, and CSV/Excel parsing. Ideal since bundle size and SEO are irrelevant for an internal tool.
- **Single Codebase Architecture:** Because we are using Flutter for both web and mobile, we will build **one single unified Flutter project**. The app will simply render the Manager Dashboard when accessed via web, and the Scanner App when installed on mobile devices, sharing 100% of the models, logic, and state management.

---

## System Architecture

### 1. Database & Backend: Supabase
- **Authentication:** Three tiers of roles: `manager`, `supervisor`, and `worker`.
- **PostgreSQL Database:** Relational data for POs, Shipments, Products, Locations, and Discrepancies.
- **Storage:** Secure buckets for storing **Discrepancy Photos** and generated **GRN (Goods Received Note)** PDFs.
- **Webhooks/Edge Functions:** For ERP/Accounting integrations (QuickBooks/SAP) and pushing manager notifications.
- **Real-time Subscriptions:** Live dashboard updates for dock door status and active receiving.

### 2. Comprehensive Database Schema (Supabase)

- **`users`**: `id`, `email`, `role` (manager, supervisor, worker)
- **`suppliers`**: `id`, `name`, `contact`, `erp_vendor_id`
- **`products` (Product Master)**: `id`, `sku`, `barcode`, `name`, `requires_lot`, `requires_serial`, `requires_expiry`
- **`purchase_orders`**: `id`, `supplier_id`, `po_number`, `status`, `blind_receiving` (boolean)
- **`po_items`**: `id`, `po_id`, `product_id`, `expected_quantity`
- **`shipments` (Carriers & Trucks)**: `id`, `po_id`, `carrier_name`, `tracking_number`, `dock_door`, `arrival_time`, `status`
- **`locations`**: `id`, `zone`, `aisle`, `bin`
- **`scan_logs` (Receiving & Put-away)**: `id`, `shipment_id`, `po_item_id`, `user_id`, `quantity`, `lot_number`, `serial_number`, `expiry_date`, `location_id` (put-away destination), `scanned_at`
- **`discrepancies`**: `id`, `shipment_id`, `po_item_id`, `user_id`, `type` (damaged, missing, wrong_item, short), `photo_url`, `notes`, `status`
- **`goods_received_notes` (GRN)**: `id`, `shipment_id`, `generated_at`, `pdf_url`, `exported_to_erp` (boolean)

---

## Core Operations & Workflows

1. **Manager/Supervisor Workflow (Flutter Web Dashboard):**
   - **Catalog & Vendor Management:** Independent tables for Products (SKUs) and Suppliers.
   - **PO Setup:** Upload/Sync POs. Toggle `blind_receiving` to hide counts from workers.
   - **Discrepancy Triage:** Review flagged items, damaged goods photos, and short shipments.
   - **Recounts & Audits:** Issue forced recount tasks to specific workers.
   - **ERP & Accounting:** View generated GRNs and trigger pushes to ERP hooks.

2. **Worker Workflow (Flutter Mobile App):**
   - **Arrival:** Select a PO, create a `Shipment` (for partial deliveries across multiple trucks), and assign a Dock Door.
   - **Receiving:** Scan items. If `blind_receiving` is true, the expected count is completely hidden to prevent bias.
   - **Data Capture:** If the Product Master requires it, dynamically prompt the worker to input Lot Numbers, Serial Numbers, or Expiry Dates (critical for food/pharma/electronics).
   - **Discrepancy Flow:** Button to flag damaged or wrong items, forcing the camera to open for photo evidence.
   - **Put-away:** Mandatory scan of the destination bin/location `id` after receiving.
   - **Completion:** Finalizing the shipment triggers an alert to the manager and auto-generates the GRN.

## User Review Required

> [!IMPORTANT]
> The database schema and workflows have been massively expanded to support your enterprise requirements (Shipments, Product Catalogs, Discrepancies/Photos, Put-away, GRNs, Lots/Serials). 
> 
> Please review the updated `tasks/` directory files as well. Once you approve this scope, we can move on to Task 01!
