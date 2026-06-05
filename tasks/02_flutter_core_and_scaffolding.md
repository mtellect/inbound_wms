# Task 02: Core Flutter App & Scaffolding

**Goal:** Initialize the unified Flutter project using your preferred feature-first architecture (`core/` & `features/`).

## Strict Development Rules
- **Always Run Dart Analysis:** Every code change MUST be followed by running `dart analyze` to ensure zero structural or typing errors before proceeding.

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
  - **Routing Architecture:** Adopt a strict, typed navigation structure:
    - `core/navigation/app_routes_path_enum.dart`: Strongly-typed enum for all paths.
    - `core/navigation/base_app_router.dart`: Extends `RootStackRouter` where `routes` are actually defined.
    - `core/navigation/app_router.dart`: Export file pulling parts together.
- [ ] **Feature Data Modeling & Service Approach:**
  - Implement the specific database domain models (`PurchaseOrder`, `Shipment`, `PoItem`, `ScanLog`) within their respective feature's `models/` directory using Freezed. **Domain models MUST NOT have `fromJson` or `toJson`.**
  - **Service Approach Pattern:** Every service must strictly follow this exact structure inside `features/<feature>/services/`:
    - `i_<feature>_api_service.dart` (Interface definition)
    - `<feature>_api_service.dart` (Concrete implementation)
    - `dto/` directory (for Response Data Transfer Objects with `fromJson`)
    - `requests/` directory (for Request Payload Data Transfer Objects with `toJson`)
    - `mappers/` directory (for converting between DTOs, Requests, and Domain Models)
  - All Supabase or external API interactions must be done via these `<feature>_api_service.dart` implementations, which must parse responses into DTOs and map them to Domain Models before returning.
  - Create standard `ChangeNotifier` providers in the `providers/` directories (e.g. `AuthProvider`, `PurchaseOrderProvider`), which rely on these injected API services.
