# Inbound MS - Universal Project Rebuild Blueprint

This document serves as a comprehensive, framework-agnostic template outlining the architecture, folder structure, core modules, and features required to recreate the "Inbound MS" (Inbound Management System) project from scratch in **any framework** (e.g., Flutter, React, Next.js, Vue, Angular, Svelte).

## 1. Project Scaffolding & Setup
- `[ ]` Initialize project repository and package manager.
- `[ ]` Configure Environment Variables (`SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`).
- `[ ]` Configure code formatters and linters (ESLint, Prettier, Dart Analysis, etc.).
- `[ ]` Setup CI/CD pipeline for deployment.

## 2. Architectural Pattern: Feature-First (Domain-Driven)
The project MUST adhere to a **Feature-First Architecture** rather than grouping files by type. The source code (`src/` or `lib/`) should be split into two main directories:
- `core/`: Application-wide constants, global utilities, global widgets, and infrastructure.
- `features/`: Isolated domains of the application (e.g., auth, dashboard, users, products). Each feature encapsulates its own models, services, state, pages, and components.

## 3. The `core/` Layer Implementation
The core layer acts as the backbone of the application.
- `[ ]` **`core/api/`**: 
  - Base API Client wrapper (Axios, Fetch, Dio).
  - Global Interceptors (Authentication token injection, 401 unauthenticated redirect handling, Error message extraction).
- `[ ]` **`core/routing/`**:
  - Global route definitions.
  - Route Guards (protecting routes based on auth state and user roles).
- `[ ]` **`core/resources/` or `core/theme/`**:
  - `app_colors`: Brand hex codes (Primary Teal, Slate Dark, Backgrounds, Status Colors).
  - `app_theme`: Global typography, input decorations, and button styles.
- `[ ]` **`core/widgets/` (Global Design System)**:
  - `[ ]` `AppButton`: Standardized primary/secondary buttons with built-in loading states.
  - `[ ]` `AppInputField`: Standardized text input fields with validation.
  - `[ ]` `AppDropdown`: Standardized select dropdowns.
  - `[ ]` `AppModal`: Standardized dialog/modal/sheet wrappers.
  - `[ ]` `AppShimmer`: Loading skeleton animations (sweeping animations for loading states).
- `[ ]` **`core/utils/`**:
  - `ToastUtils`: Global snackbar/toast notifications for success and error handling.
- `[ ]` **`core/startup/` (or DI layer)**:
  - Dependency Injection container setup or global Context providers initialization.

## 4. The `features/` Modules implementation
For each feature, follow the internal structure: `models/`, `services/` (API calls), `providers/` (State Management), `pages/` (Screens), `widgets/` (Feature-specific components).

### Feature 1: Authentication & Authorization (`features/auth`)
- `[ ]` Service: Auth API integration (Supabase/Firebase auth).
- `[ ]` State: Manage user session persistence and active user roles.
- `[ ]` Pages: Sign In Page (Email/Password).
- `[ ]` Logic: Role Management (Admin, Manager, Supervisor, Worker).

### Feature 2: Dashboard Overview (`features/dashboard`)
- `[ ]` Pages: Dashboard Shell (Sidebar Layout + Main Content Area).
- `[ ]` Pages: Overview Dashboard with Loading/Loaded states.
- `[ ]` Widgets: KPI Cards (Total POs, Received, Pending, Discrepancies).
- `[ ]` Widgets: Recent Activity Feed (List of latest scans or system events).
- `[ ]` Widgets: Quick Actions Panel (e.g., "Scan Barcode", "New PO").

### Feature 3: User Management (`features/users` - Admin Only)
- `[ ]` Service/State: Fetch users list and manage mutations.
- `[ ]` Pages: Users List Data Table (Name, Email, Role, Status, Last Login).
- `[ ]` Widgets: "Add User" Modal Flow (Direct API creation via secure admin endpoint or `service_role` key).
- `[ ]` Forms: Fields for Display Name, Email, Temporary Password, Role, Status, Requires Password Reset.
- `[ ]` Logic: Edit User Details (Update roles and status).

### Feature 4: Purchase Orders (`features/purchase_orders`)
- `[ ]` Pages: Purchase Orders List Data Table.
- `[ ]` Widgets: Import POs Modal (CSV/Excel file parsing and uploading logic).
- `[ ]` Widgets: Create PO Modal (Manual data entry).
- `[ ]` Pages: PO Details View (Line items, expected quantities, SKU, Status).

### Feature 5: Receiving Operations (`features/receiving`)
- `[ ]` Pages: Active Receiving Sessions List.
- `[ ]` Widgets: "Scan PO" Modal (Auto-select PO via barcode scanner input).
- `[ ]` Pages: Session Manifest Table (Tracking expected vs. scanned quantities).
- `[ ]` Logic: Real-time Barcode Scanning Input (Rapid entry for updating received counts).
- `[ ]` Logic: Complete/Finalize Session flow.

### Feature 6: Discrepancies & Triage (`features/discrepancies`)
- `[ ]` Pages: Triage Dashboard (List of under-received, over-received, or damaged goods).
- `[ ]` Widgets: Resolve Discrepancy Flow (Approve, Reject, or Request Supplier Credit).

### Feature 7: Master Data Management
- `[ ]` **Products (`features/products`)**: Product catalog, SKU lookup, descriptions, unit of measure.
- `[ ]` **Suppliers (`features/suppliers`)**: Supplier directory, contact info, associated POs.
- `[ ]` **Shipments (`features/shipments`)**: Tracking inbound shipments and ASN (Advance Shipping Notice) data.

## 5. Polish & Finalization
- `[ ]` Cross-browser/Cross-device responsive design checks (Desktop, Tablet, Mobile).
- `[ ]` Error boundary handling for fatal application crashes.
- `[ ]` Performance optimization (lazy loading, asset minification/caching).
