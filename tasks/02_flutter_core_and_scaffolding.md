# Task 02: Core Flutter App & Scaffolding

**Goal:** Initialize the unified Flutter project using your preferred feature-first architecture (`core/` & `features/`).

## Sub-tasks
- [x] **Initialize App:**
  - Create the Flutter project directly in the `inbound_ms/` root.
  - Configure dependencies: `supabase_flutter`, `freezed`, `auto_route`, `provider`, and `get_it`.
- [x] **Scaffold Directory Structure:**
  - Create the `lib/core/` directory with standard subfolders (`api`, `constants`, `di`, `enums`, `extensions`, `local_db`, `navigation`, `providers`, `services`, `startup`, `theme`, `utils`, `widgets`).
  - Create the `lib/features/` directory with the following initial domain folders:
    - `auth`
    - `dashboard`
    - `purchase_orders`
    - `shipments`
    - `receiving` (Worker scanner flows)
    - `discrepancies`
    - `products` (Catalog master)
    - `suppliers`
  - Inside each feature, create the standard subdirectories: `models`, `pages`, `providers`, `services` (with `dtos` and `mappers` if needed), and `widgets`.
- [ ] **Core Architecture Implementation:**
  - Implement **Dependency Injection** using `get_it`.
  - Implement a robust `core/api/` network client structure as a reusable template, incorporating:
    - `base_api.dart`: Central export file organizing parts.
    - `api_client.dart` & `api_functions.dart`: Core HTTP request handling and error parsing via Dio.
    - `api_urls.dart`: Centralized endpoint management.
    - `api_response.dart`: Standardized wrapper models.
    - `env_configurations_model.dart`: Environment configuration injection.
    - `interceptors/`: Request mutation and logging (`authentication`, `body`, `headers`, `error`, `connectivity`).
    - `exception/`: Standard API exceptions (`api_error`, `api_cancelled`, `no_content`).
  - Create `core/startup/startup_service.dart` to handle ordered initialization (`registerNetwork`, `registerLocalDb`, `registerServices`, `registerControllers`).
  - Implement `auto_route` in `core/navigation/app_router.dart` to properly route web users vs mobile workers.
- [ ] **Feature Data Modeling & Service Approach:**
  - Implement the specific database models (`PurchaseOrder`, `Shipment`, `PoItem`, `ScanLog`) within their respective feature's `models/` directory using Freezed.
  - **Service Approach:** For every feature's business logic and Supabase interaction, define an interface (e.g., `i_purchase_order_service.dart`) and its concrete implementation (e.g., `purchase_order_service.dart`), registering the interface in `get_it`.
  - Create standard `ChangeNotifier` providers in the `providers/` directories (e.g. `AuthProvider`, `PurchaseOrderProvider`), which rely on these injected services.
