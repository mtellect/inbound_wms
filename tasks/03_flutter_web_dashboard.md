# Task 03: Dashboard Screens (Manager & Supervisor)

**Goal:** Build the command center views within a unified framework-agnostic architecture.

## Sub-tasks
- [x] **Global Application Shell:**
  - [x] Create a root Layout/Shell wrapper housing the Side Navigation.
  - [x] Configure nested routing for all dashboard child pages.
  - [x] Ensure full-viewport height layout.

- [x] **Generic Data Table Architecture:**
  - [x] Build reusable Table View Component with support for Custom Column Types, Empty/Loading States, and Pagination.

- [x] **Master Data Management:**
  - [x] Build views for managing `products` (SKUs, names, tracking requirements).
  - [x] Build views for managing `suppliers`.
  - [x] Build views for managing `users` (Roles, Status).

- [x] **PO & Shipment Tracking:**
  - [x] Build dashboard to track active POs.
  - [x] Build dashboard to track Shipments.

- [x] **Discrepancy Resolution & Operations:**
  - [x] Build triage view for supervisors to review discrepancies.
  - [x] Build `sessions` history page to track historical scanning workflows.

- [ ] **Import / Export / ERP:**
  - [ ] Implement `.xlsx`/`.csv` import for POs using generic file pickers.
  - [ ] Implement GRN viewing and ERP sync status page.

- [ ] **Notifications:**
  - [ ] Implement real-time alerts for completed shipments and newly logged discrepancies.
