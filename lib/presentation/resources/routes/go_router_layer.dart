import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:acacia/presentation/resources/routes/undefined_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> appRoutes = [
  GoRoute(
    path: RoutesStrings.unDefinedRoute,
    builder: (context, state) => UndefinedScreen(),
  ),
  GoRoute(
    path: RoutesStrings.loginRoute,
    builder: (context, state) => UndefinedScreen(),
  ),
];
//todo admin routes

final ValueNotifier<RoutingConfig> appRoutingConfig =
    ValueNotifier<RoutingConfig>(RoutingConfig(routes: appRoutes));

enum UserRole { guest, customer, admin }

class AuthState {
  final bool isAuthenticated;
  final UserRole role;

  AuthState({required this.isAuthenticated, required this.role});
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isAuthenticated: false, role: UserRole.guest));

  void loginAsAdmin() =>
      emit(AuthState(isAuthenticated: true, role: UserRole.admin));
  void loginAsCustomer() =>
      emit(AuthState(isAuthenticated: true, role: UserRole.customer));
  void logout() =>
      emit(AuthState(isAuthenticated: false, role: UserRole.guest));
}

final List<ProtectedRoute> protectedRoutes = [
  ProtectedRoute(
    path: '/admin',
    name: 'adminDashboard',
    builder: (_, __) => const UndefinedScreen(),
    allowedRoles: [UserRole.admin],
  ),
  ProtectedRoute(
    path: '/orders',
    name: 'customerOrders',
    builder: (_, __) => const UndefinedScreen(),
    allowedRoles: [UserRole.customer],
  ),
];

class ProtectedRoute {
  final String path;
  final String name;
  final Widget Function(BuildContext, GoRouterState) builder;
  final List allowedRoles;

  const ProtectedRoute({
    required this.path,
    required this.name,
    required this.builder,
    required this.allowedRoles,
  });
}

List<GoRoute> generateRoutes(AuthCubit authCubit) {
  return protectedRoutes.map((route) {
    return GoRoute(
      path: route.path,
      name: route.name,
      builder: route.builder,
      redirect: (context, state) {
        final auth = authCubit.state;

        if (!auth.isAuthenticated) return '/login';

        if (!route.allowedRoles.contains(auth.role)) {
          return '/unauthorized';
        }

        return null;
      },
    );
  }).toList();
}
