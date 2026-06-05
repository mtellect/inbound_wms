# Task 01: Setup & Data Analysis

**Goal:** Finalize the enterprise database schema and initialize the Supabase backend.

## Sub-tasks
- [ ] **Data Mapping:**
  - Read `/po_samples/PO-SPAE-003382127 - Bella FOC.xlsx`.
  - Extract PO, Supplier, and Product catalog data to help seed the `products` and `suppliers` tables.
- [ ] **Supabase Initialization:**
  - Create the Supabase project.
  - Setup Authentication with `manager`, `supervisor`, and `worker` roles.
  - Setup Storage buckets: `discrepancy_photos` and `grn_documents`.
- [ ] **Database Schema Execution:**
  - Write and execute SQL scripts to create tables: `users`, `suppliers`, `products`, `locations`, `purchase_orders`, `po_items`, `shipments`, `scan_logs`, `discrepancies`, and `goods_received_notes`.
  - Configure Real-time subscriptions for dashboard monitoring.
  - Setup Row Level Security (RLS) to enforce role-based access.
