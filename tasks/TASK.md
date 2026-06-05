# Inbound MS - Universal Project Rebuild Blueprint

This document serves as a comprehensive, framework-agnostic template outlining the architecture, folder structure, core modules, and detailed features required to recreate the "Inbound MS" (Inbound Management System) project from scratch.

## 1. Project Scaffolding & Setup
- `[ ]` Initialize project repository and package manager.
- `[ ]` Configure Environment Variables (`SUPABASE_URL`, `SUPABASE_ANON_KEY`, `SUPABASE_SERVICE_ROLE_KEY`).
- `[ ]` Setup Core Entry Points (`main.dart` / `index.js` / `App.vue`) and basic wrapper structure.
- `[ ]` Configure code formatters and linters.
- `[ ]` Setup CI/CD pipeline for deployment.

## 2. Architectural Pattern: Feature-First (Domain-Driven)
The codebase must be split into two main layers:
- `core/`: Application-wide constants, global utilities, global widgets, and infrastructure.
- `features/`: Isolated domains (e.g., auth, dashboard). Each feature strictly encapsulates its own layers.

---

## 3. Data Flow Architecture (Models, DTOs, Mappers, Services, Enums)
To ensure separation of concerns between the API layer and the UI layer, every feature MUST implement the following layers:

### 3.1. Enums (`enums/`)
- `[ ]` Define strict typings for bounded values.
  - Examples: `ApiEnvironmentEnum`, `UserRole` (admin, manager, supervisor, worker).

### 3.2. Models (`models/`)
- `[ ]` Define clean, UI-facing domain entities. These models should NOT contain JSON serialization logic.
  - Examples: `AppUser`, `Product`, `PurchaseOrder`, `POItem`, `Shipment`, `ScanSession`, `ScanLog`, `Discrepancy`, `Supplier`, `DashboardKpi`, `DashboardActivity`.

### 3.3. DTOs (Data Transfer Objects) (`services/dto/`)
- `[ ]` Define API-facing network models. These models handle exactly what the backend JSON expects/returns.
  - Examples: `AppUserDto`, `ProductDto`, `PurchaseOrderDto`, `POItemDto`, `ShipmentDto`, `ScanSessionDto`, `ScanLogDto`.

### 3.4. Mappers (`services/mappers/`)
- `[ ]` Implement mapper functions to convert between pure `Models` (UI layer) and `DTOs` (Network layer).
  - Examples: `AppUserMapper`, `ProductMapper`, `PurchaseOrderMapper`, `POItemMapper`, `ShipmentMapper`, `ScanSessionMapper`, `ScanLogMapper`.

### 3.5. Services (`services/`)
- `[ ]` Define abstract interfaces (`IUserApiService`, `IPurchaseOrderApiService`, `ISessionApiService`, `IDashboardApiService`, `IAuthenticationApiService`).
- `[ ]` Implement concrete Service classes that use the API Client to fetch JSON, parse into DTOs, and map into Models using the Mappers.

---

## 4. The `core/` Layer Implementation

### 4.1. Infrastructure & API (`core/api/`)
- `[ ]` **Base API Client**: Abstract HTTP client wrapper (Axios/Dio/Fetch).
- `[ ]` **API URLs & Functions**: Centralized URL endpoints and function names.
- `[ ]` **Custom Exceptions**: `ApiCancelledException`, `ApiErrorException`, `NoContentException`, `NoDataException`, `UnsuccessfulApiStatusException`.
- `[ ]` **API Interceptors**: 
  - `AuthenticationInterceptor`: Injects bearer tokens into headers.
  - `HeadersInterceptor`: Adds standard content-type and platform headers.
  - `ErrorInterceptor`: Catches 401s to force logout, parses backend error shapes.
  - `BodyInterceptor` & `ConnectivityInterceptor`: Data normalization and offline-check.

### 4.2. Routing & Navigation (`core/navigation/`)
- `[ ]` **App Router**: Centralized route tree setup.
- `[ ]` **Route Paths Enum**: Strongly typed routing paths.
- `[ ]` **Auth Guard**: Middleware to bounce unauthenticated users to `/sign-in` and authenticated users away from `/sign-in`.

### 4.3. Application Services & State (`core/services/` & `core/startup/`)
- `[ ]` **Startup Service (DI Container)**: Register all singleton services and factories (`GetIt` or Context setup).
- `[ ]` **Environment Service**: Manages switching between dev/staging/prod variables.

### 4.4. Theme & Resources (`core/resources/` & `core/theme/`)
- `[ ]` **App Colors**: Brand hex codes (Primary Teal, Slate Dark, Status colors).
- `[ ]` **App Theme**: Global typography, input decorations, button styles.
- `[ ]` **Theme Provider**: Handles switching themes if applicable.

### 4.5. Global Utilities & Extensions (`core/utils/` & `core/extensions/`)
- `[ ]` **Extensions**: Context helpers, DateTime formatting, Number parsing, Base generic extensions.
- `[ ]` **Utils**: `DialogUtils` (for global dialogs), `ToastUtils` (for success/error snacks), `UuidUtils` (for local ID generation), `DateFormatter`.

### 4.6. Global Design System (`core/widgets/`)
- `[ ]` **Inputs & Buttons**: `AppButton`, `AppInputField`, `AppDropdownButton`.
- `[ ]` **Visual Effects**: `AppShimmer` (sweeping loading skeletons), `DashPainter`, `DashedSeparator`, `DottedBorder`.
- `[ ]` **Layout & Feedback**: `PageHeader`, `DeleteConfirmationDialog`.
- `[ ]` **App Table System (`core/widgets/table/`)**: Fully reusable data table system with `AppTableView`, `AppTableHeader`, `AppTableBody`, `AppTableCell`, `AppTableEmptyState`, and `BulkActionToolbar`.

---

## 5. The `features/` Modules Implementation

### 5.1. Authentication (`features/auth`)
- `[ ]` **State/Provider**: `AuthProvider` (managing session state).
- `[ ]` **Pages**: `SignInPage`.

### 5.2. Local Storage (`features/local_db`)
- `[ ]` **Service**: `LocalDbService` (wrapper for SharedPrefs/LocalStorage to cache settings or tokens).

### 5.3. Dashboard (`features/dashboard`)
- `[ ]` **State/Provider**: `DashboardProvider`.
- `[ ]` **Pages**: `DashboardShellPage` (layout with Sidebar), `DashboardOverviewPage`.
- `[ ]` **Widgets**: `DashboardSideNavigation`, `KpiCard`, `QuickActionsCard`, `RecentActivityList`, `SectionCard`.
- `[ ]` **States**: `DashboardOverviewLoadingState`, `DashboardOverviewLoadedState`.

### 5.4. Users Administration (`features/users`)
- `[ ]` **State/Provider**: `UserProvider`.
- `[ ]` **Pages**: `UsersPage` (list of internal users).
- `[ ]` **Widgets**: `UserDetailsModal` (Create/Edit user flow).

### 5.5. Master Data: Products (`features/products`)
- `[ ]` **Pages**: `ProductsPage`.

### 5.6. Master Data: Suppliers (`features/suppliers`)
- `[ ]` **Pages**: `SuppliersPage`.

### 5.7. Master Data: Shipments (`features/shipments`)
- `[ ]` **Pages**: `ShipmentsPage` (tracking inbound logistics and ASNs).

### 5.8. Purchase Orders (`features/purchase_orders`)
- `[ ]` **State/Provider**: `PurchaseOrderProvider`.
- `[ ]` **Specialized Services**: `ImportOrdersService` (handling CSV/Excel parsing).
- `[ ]` **Pages**: `PurchaseOrdersPage`.
- `[ ]` **Widgets**: `CreatePoModal` (manual), `ImportOrdersModal` (bulk file upload), `PurchaseOrderDetailsModal`, `PoImportView`.

### 5.9. Receiving Operations (`features/receiving`)
- `[ ]` **State/Provider**: `SessionProvider`.
- `[ ]` **Pages**: `SessionsPage` (active receiving tasks).
- `[ ]` **Widgets**: 
  - `ScanPoModal` (barcode scanning or manual select).
  - `SessionDetailsModal` (Receiving UI).
  - `SessionManifestTable` (Expected vs Actual counts).
  - `ScanMetricsRow`, `MetricCard`, `PoContextHeader`, `MetaField`.

### 5.10. Discrepancies & Triage (`features/discrepancies`)
- `[ ]` **Pages**: `DiscrepancyTriagePage` (List of anomalies).

---

## 6. Polish & Finalization
- `[ ]` Cross-browser/Cross-device responsive design checks (Desktop, Tablet, Mobile).
- `[ ]` Verify interceptors handle 401 Unauthorized globally.
- `[ ]` Verify empty states and loading states (AppShimmer) are bound to all tables.
- `[ ]` Performance optimization (lazy loading, asset minification/caching).
