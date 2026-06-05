# Task 04: Scanner Screens (Receiving Workflow)

**Goal:** Build the advanced receiving and put-away flows within a framework-agnostic scanning architecture.

## Sub-tasks
- [x] **Active Scanner Interface (Desktop/Web Mode):**
  - [x] Top Meta Section (locked context for Shipment/Supplier).
  - [x] Focused hidden/visible text listener for physical HID Barcode Wedge Scanners (Keyboard Emulation).
  - [x] Live Metrics Row (Total Units, Correct, Mismatch, Wrong).
  - [x] Live Session Table tracking barcodes instantly as they are scanned.

- [ ] **Mobile Camera Integration:**
  - [ ] Integration with native camera APIs for scanning barcodes on physical mobile devices.

- [ ] **Advanced Scanning UI:**
  - [ ] Standard vs. Blind Receiving mode (hide expected totals if `blind_receiving` is true).
  - [ ] Dynamic prompts for capturing Lot Numbers, Serial Numbers, and Expiration Dates for flagged products.

- [ ] **Discrepancy Workflow:**
  - [ ] UI to flag an item (damaged, overage, wrong item, short).
  - [ ] Integrate device camera for mandatory photo evidence capture.

- [ ] **Put-away Step:**
  - [ ] Scanning step for destination bin/location.
