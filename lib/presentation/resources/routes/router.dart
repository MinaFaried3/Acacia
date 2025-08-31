import 'package:acacia/app/app.dart';
import 'package:acacia/app/config/app_mode.dart';
import 'package:acacia/app/services/navigation/observers.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/presentation/modules/admin/dashboard/cubit/dashboard_cubit.dart';
import 'package:acacia/presentation/modules/admin/dashboard/dashboard_screen.dart';
import 'package:acacia/presentation/modules/admin/login/login_screen.dart';
import 'package:acacia/presentation/modules/admin/oil/oil_screen.dart';
import 'package:acacia/presentation/modules/admin/priceList/price_list_screen.dart';
import 'package:acacia/presentation/modules/admin/product/products_screen.dart';
import 'package:acacia/presentation/modules/admin/product_details/product_details_screen.dart';
import 'package:acacia/presentation/modules/shared/undefined/undefined_screen.dart';
import 'package:acacia/presentation/resources/routes/routes_builder.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:acacia/presentation/ui/animation/route/fade_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> appRoutes = [
  Routes.undefined.toAppGoRoute(
    builder: (context, state) => const UndefinedScreen(),
  ),
  Routes.adminLogin.toAppGoRoute(
    builder: (context, state) => const AdminLoginScreen(),
  ),

  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) => BlocProvider(
      create: (context) => DashboardCubit(),
      child: DashboardScreen(navigationShell: navigationShell),
    ),
    branches: [
      StatefulShellBranch(
        routes: [
          Routes.products.toAppGoRoute(
            builder: (context, state) => const ProductsScreen(),
            routes: [
              Routes.productDetails.toAppGoRoute(
                parentNavigatorKey: MyApp.navigatorKey,
                pageBuilder: (context, state) => FadeTransitionPage(
                  key: state.pageKey,
                  child: ProductDetailsScreen(),
                ),
                // builder: (context, state) => ProductDetailsScreen(),
              ),
            ],
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
          ),
        ],
      ),
    ],
  ),
];

final ValueNotifier<RoutingConfig> appRoutingConfig =
    ValueNotifier<RoutingConfig>(
      RoutingConfig(
        routes: buildRoutes(appRoutes),
        redirect: (context, state) {
          //todo opening route here
          printer('state.matchedLocation: ${state.matchedLocation}');
          printer('state.topRoute: ${state.topRoute}');
        },
      ),
    );

final GoRouter router = GoRouter.routingConfig(
  initialLocation: Routes.adminLogin.path,

  routingConfig: appRoutingConfig,
  navigatorKey: MyApp.navigatorKey,
  observers: routesObservers,
  debugLogDiagnostics: AppMode.devMode,

  errorBuilder: (context, state) {
    printer('error from go router', color: ConsoleColor.redBg);
    return UndefinedScreen();
  },
);
