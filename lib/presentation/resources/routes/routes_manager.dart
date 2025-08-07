import 'package:acacia/app/shared/enums/user_role.dart';
import 'package:acacia/presentation/resources/routes/route_data.dart';

abstract class RoutesNames {
  static const String unDefined = 'undefined';
  static const String adminLogin = 'adminLogin';
  static const String dashboard = 'dashboard';
  static const String products = 'products';
  static const String productDetails = 'productsDetails';
  static const String priceLists = 'priceLists';
  static const String oils = 'oils';
}

abstract class Routes {
  static const RouteData undefined = RouteData(
    name: RoutesNames.unDefined,
    path: '/${RoutesNames.unDefined}',
    allowedRoles: allAllowedRoles,
  );

  static const adminLogin = RouteData(
    name: RoutesNames.adminLogin,
    path: '/${RoutesNames.adminLogin}',
    allowedRoles: allAllowedRoles,
  );

  static const dashboard = RouteData(
    name: RoutesNames.dashboard,
    path: '/${RoutesNames.dashboard}',
    allowedRoles: adminRole,
  );

  static const products = RouteData(
    name: RoutesNames.products,
    path: '/${RoutesNames.products}',
    allowedRoles: adminRole,
  );

  static const oils = RouteData(
    name: RoutesNames.oils,
    path: '/${RoutesNames.oils}',
    allowedRoles: adminRole,
  );

  static const productDetails = RouteData(
    name: RoutesNames.productDetails,
    path: RoutesNames.productDetails,
    // path: '/${RoutesNames.productDetails}',
    allowedRoles: adminRole,
  );

  static const priceList = RouteData(
    name: RoutesNames.priceLists,
    path: '/${RoutesNames.priceLists}',
    allowedRoles: adminRole,
  );
}
