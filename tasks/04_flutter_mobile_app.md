# Task 04: Mobile Scanner Screens (Worker)

**Goal:** Build the advanced receiving and put-away flows within the unified Flutter app.

## Sub-tasks
- [ ] **Shipment Arrival Flow:**
  - Build views in `lib/screens/mobile/` to select a PO, create `Shipment`, and assign Dock Doors.
- [ ] **Advanced Scanning UI:**
  - Standard vs. Blind Receiving mode (hide expected totals if `blind_receiving` is true).
  - Integration with `mobile_scanner` (or similar) for camera barcodes.
  - Dynamic prompts for capturing Lot Numbers, Serial Numbers, and Expiration Dates.
- [ ] **Discrepancy Workflow:**
  - UI to flag an item (damaged, overage, wrong item, short).
  - Integrate device camera for mandatory photo evidence capture.
- [ ] **Put-away Step:**
  - Scanning step for destination bin/location.
- [ ] **Audits & Recounts:**
  - UI to handle recount tasks assigned by supervisors.
