import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/users/pages/users_page.dart';
import 'app_routes_path_enum.dart';
import 'package:inbound_ms/features/auth/pages/sign_in_page.dart';
import 'package:inbound_ms/features/dashboard/pages/dashboard_shell_page.dart';
import 'package:inbound_ms/features/dashboard/pages/dashboard_overview_page.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';
import 'package:inbound_ms/features/products/pages/products_page.dart';
import 'package:inbound_ms/features/suppliers/pages/suppliers_page.dart';
import 'package:inbound_ms/features/purchase_orders/pages/purchase_orders_page.dart';
import 'package:inbound_ms/features/shipments/pages/shipments_page.dart';
import 'package:inbound_ms/features/discrepancies/pages/discrepancy_triage_page.dart';
import 'package:inbound_ms/features/receiving/pages/sessions_page.dart';

import 'guards/auth_guard.dart';

export 'app_routes_path_enum.dart';

part 'app_router.gr.dart';
part 'base_app_router.dart';
part 'custom_routes.dart';
