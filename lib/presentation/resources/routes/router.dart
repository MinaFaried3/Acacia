import 'package:acacia/presentation/modules/admin/dashboard/dashboard_screen.dart';
import 'package:acacia/presentation/modules/admin/login/login_screen.dart';
import 'package:acacia/presentation/modules/admin/oil/oil_screen.dart';
import 'package:acacia/presentation/modules/admin/priceList/price_list_screen.dart';
import 'package:acacia/presentation/modules/admin/product/products_screen.dart';
import 'package:acacia/presentation/modules/admin/product_details/product_details_screen.dart';
import 'package:acacia/presentation/modules/shared/undefined/undefined_screen.dart';
import 'package:acacia/presentation/resources/routes/routes_builder.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> appRoutes = [
  Routes.undefined.toAppGoRoute(
    builder: (context, state) => const UndefinedScreen(),
  ),
  Routes.adminLogin.toAppGoRoute(
    builder: (context, state) => const AdminLoginScreen(),
  ),

  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        DashboardScreen(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        routes: [
          Routes.products.toAppGoRoute(
            builder: (context, state) => const ProductsScreen(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          Routes.oils.toAppGoRoute(
            builder: (context, state) => const OilsScreen(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          Routes.priceList.toAppGoRoute(
            builder: (context, state) => const PriceListsScreen(),
            routes: [
              Routes.productDetails.toAppGoRoute(
                builder: (context, state) => ProductDetailsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];

final ValueNotifier<RoutingConfig> appRoutingConfig =
    ValueNotifier<RoutingConfig>(RoutingConfig(routes: buildRoutes(appRoutes)));
