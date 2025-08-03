import 'package:acacia/presentation/resources/routes/undefined_route.dart';
import 'package:flutter/material.dart';

class RoutesStrings {
  static const String startNowRoute = '/';
  static const String onboardingRoute = 'onboarding';
  static const String mainRoute = 'main';
  static const String loginRoute = 'login';
  static const String otpRoute = '/otp';
  static const String startRoute = '/start';

  // static const String home = '/';
  static const String connectWithUsRoute = '/connect-with-us';

  static const String menuRoute = '/menu';
  static const String notificationRoute = '/notification';
  static const String carsRoute = '/cars';
  static const String profileRoute = '/profile';

  static const String editAndAddServicesRoute = '/edit-services';
  static const String myLocationRoute = '/my-location';
  static const String addMapsLocationRoute = '/add-maps-location';

  static const String offerRoute = '/offer';
  static const String subscriptionsRoute = '/subscriptions';
  static const String userSubscriptionsRoute = '/user-subscriptions';
  static const String ordersRoute = '/orders';
  static const String orderItemRoute = '/orderItem';
  static const String subItemRoute = '/subItem';

  static const String unDefinedRoute = '/un_defined';
  static const String testRoute = '/test';
  static const String tempRoute = '/temp';
  static const String connectionRoute = '/connection-error';
  static const String notFound404Route = '/not-found-404';
  static const String langRoute = '/lang';

  static const String defaultTermsAndConditionsRoutes = '/terms-and-conditions';
  static const String paymentTermsAndConditionsRoutes =
      '/payment-terms-and-conditions';

  //payment
  static const String bankPaymentRoute = '/bank_payment';
}

enum Routes {
  // startNowRoute(RoutesStrings.startNowRoute),
  onboardingRoute(RoutesStrings.onboardingRoute),
  loginRoute(RoutesStrings.loginRoute),
  otpRoute(RoutesStrings.otpRoute),
  mainRoute(RoutesStrings.mainRoute),
  menuRoute(RoutesStrings.menuRoute),
  carsRoute(RoutesStrings.carsRoute),
  connectWithUsRoute(RoutesStrings.connectWithUsRoute),
  notificationRoute(RoutesStrings.notificationRoute),
  editAndAddServicesRoute(RoutesStrings.editAndAddServicesRoute),
  myLocationRoute(RoutesStrings.myLocationRoute),
  addMapsLocationRoute(RoutesStrings.addMapsLocationRoute),
  tempRoute(RoutesStrings.tempRoute),
  unDefined(RoutesStrings.unDefinedRoute),
  notFound404(RoutesStrings.notFound404Route),
  connectionErrorRoute(RoutesStrings.connectionRoute),
  profileRoute(RoutesStrings.profileRoute),
  offerRoute(RoutesStrings.offerRoute),
  subscriptionsRoute(RoutesStrings.subscriptionsRoute),
  userSubscriptionsRoute(RoutesStrings.userSubscriptionsRoute),
  ordersRoute(RoutesStrings.ordersRoute),
  testRoute(RoutesStrings.testRoute),
  orderItemRoute(RoutesStrings.orderItemRoute),
  subItemRoute(RoutesStrings.subItemRoute),
  langRoute(RoutesStrings.langRoute),
  bankPaymentRoute(RoutesStrings.bankPaymentRoute),
  defaultTermsAndConditionsRoutes(
    RoutesStrings.defaultTermsAndConditionsRoutes,
  );

  final String path;

  const Routes(this.path);
}

class RouteGenerator {
  //very important don't forget to add any route can be a opening route at here
  //this will automatically wrapped with upgrade checker to check id there a new version at stores or not
  static const List<Routes> startEntryRoutes = [
    Routes.onboardingRoute,
    Routes.loginRoute,
    Routes.mainRoute,
  ];

  static Route<dynamic> getRoute(RouteSettings settings) {
    Routes currentRoute = Routes.values.firstWhere(
      (element) => element.path == settings.name,
      orElse: () => Routes.unDefined,
    );

    final args = settings.arguments;

    return unDefinedRoute();
    //
    // switch (currentRoute) {
    //   case Routes.loginRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareLoginRegisterModule,
    //       providers: BlocProvidersManager.loginProviders,
    //       route: currentRoute,
    //       screen: const EmailLoginScreen(),
    //     );
    //
    //   case Routes.otpRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareOtpVerifyModule,
    //       providers: () => BlocProvidersManager.otpProviders,
    //       route: currentRoute,
    //       screen: OTPScreen(
    //         email: args.toString(),
    //       ),
    //     );
    //
    //   case Routes.onboardingRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareOnboardingModule,
    //       providers: () => BlocProvidersManager.onboardingProviders,
    //       route: currentRoute,
    //       screen: const OnboardingScreen(),
    //     );
    //
    //   case Routes.mainRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareMainModule,
    //       providers: BlocProvidersManager.mainProviders,
    //       route: currentRoute,
    //       screen: const MainScreen(),
    //     );
    //
    //   case Routes.notificationRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareNotificationModule,
    //       providers: BlocProvidersManager.notificationProviders,
    //       route: currentRoute,
    //       screen: const NotificationScreen(),
    //     );
    //
    //   case Routes.menuRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareMenuModule,
    //       providers: BlocProvidersManager.menuProviders,
    //       route: currentRoute,
    //       screen: const MenuScreen(),
    //     );
    //
    //   case Routes.carsRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareCarModule,
    //       providers: () => BlocProvidersManager.carsProviders,
    //       route: currentRoute,
    //       screen: const CarsScreen(),
    //     );
    //
    //   case Routes.editAndAddServicesRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareMainModule,
    //       providers: BlocProvidersManager.mainProviders,
    //       route: currentRoute,
    //       screen: const EditAddServicesScreen(),
    //     );
    //
    //   case Routes.addMapsLocationRoute:
    //     if (args is! AddMapLocationScreenArgs) {
    //       throw ArgumentError('Expected arguments');
    //     }
    //     return buildRoute(
    //         prepareModule: DIModulesManger.prepareAddMapsLocationModule,
    //         providers: BlocProvidersManager.addMapsLocationProviders,
    //         route: currentRoute,
    //         screen: AddMapsLocationScreen(
    //           args: args,
    //         ));
    //
    //   case Routes.myLocationRoute:
    //     return buildRoute(
    //         prepareModule: DIModulesManger.prepareUserLocationModule,
    //         providers: BlocProvidersManager.userLocationProviders,
    //         route: currentRoute,
    //         screen: MyLocationScreen());
    //
    //   case Routes.offerRoute:
    //     if (args is OfferScreenArgs) {
    //       return buildRoute(
    //         prepareModule: DIModulesManger.prepareOfferModule,
    //         providers: BlocProvidersManager.mainProviders,
    //         route: currentRoute,
    //         screen: OfferScreen(offerScreenArgs: args),
    //       );
    //     } else {
    //       throw ArgumentError(
    //           'Expected arguments to be of type Map<String, dynamic>.');
    //     }
    //
    //   case Routes.tempRoute:
    //     return buildAppPageRoute(
    //       route: currentRoute,
    //       screenBuilder: (context) => TempScreen(),
    //     );
    //
    //   case Routes.notFound404:
    //     return buildAppPageRoute(
    //       route: currentRoute,
    //       screenBuilder: (context) => NotFoundPage(
    //         errorMessage: args.toString(),
    //       ),
    //     );
    //
    //   case Routes.connectionErrorRoute:
    //     return buildAppPageRoute(
    //       route: currentRoute,
    //       screenBuilder: (context) => ConnectionError(),
    //     );
    //
    //   case Routes.connectWithUsRoute:
    //     return buildAppPageRoute(
    //       route: currentRoute,
    //       screenBuilder: (context) => ConnectWithUsScreen(),
    //     );
    //   case Routes.profileRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareMainModule,
    //       providers: BlocProvidersManager.mainProviders,
    //       route: currentRoute,
    //       screen: const ProfilePage(),
    //     );
    //
    //   case Routes.subscriptionsRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareSubscriptionsModule,
    //       providers: BlocProvidersManager.subscriptionsProvider,
    //       route: currentRoute,
    //       screen: const SubscriptionsScreen(),
    //     );
    //   case Routes.userSubscriptionsRoute:
    //     return unDefinedRoute();
    //   case Routes.ordersRoute:
    //     final OrdersTapType? tapType = args is OrdersTapType ? args : null;
    //
    //     PrintManager.print(tapType, color: ConsoleColor.cyanBg);
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareOrdersModule,
    //       providers: () => BlocProvidersManager.ordersProvider,
    //       route: currentRoute,
    //       screen: OrderPage(openingTap: tapType),
    //     );
    //
    //   case Routes.orderItemRoute:
    //     if (args is! OrderItemScreenArgs) {
    //       throw ArgumentError('Expected arguments');
    //     }
    //     //todo context
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareOrdersModule,
    //       route: currentRoute,
    //       screen: OrderItemScreen(args: args),
    //     );
    //
    //   case Routes.subItemRoute:
    //     if (args is! SubscriptionItemScreenArgs) {
    //       throw ArgumentError('Expected arguments');
    //     }
    //
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareOrdersModule,
    //       route: currentRoute,
    //       screen: SubscriptionItemScreen(
    //         args: args,
    //       ),
    //     );
    //
    //   case Routes.langRoute:
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareMainModule,
    //       providers: () => BlocProvidersManager.mainProviders(),
    //       route: currentRoute,
    //       screen: LanguageScreen(),
    //     );
    //
    //   case Routes.bankPaymentRoute:
    //     if (args is! BankPaymentScreenArgs) {
    //       throw ArgumentError('Expected arguments');
    //     }
    //
    //     return buildRoute(
    //       prepareModule: DIModulesManger.prepareBankPaymentModule,
    //       providers: () => BlocProvidersManager.bankPaymentProviders(),
    //       route: currentRoute,
    //       screen: BankPaymentScreenBuilder(
    //         args: args,
    //       ),
    //     );
    //
    //   case Routes.defaultTermsAndConditionsRoutes:
    //     return BottomSlidePageRoute(
    //         builder: (_) => DefaultTermsAndConditions());
    //   case Routes.testRoute:
    //     return unDefinedRoute();
    //   case Routes.unDefined:
    //     return unDefinedRoute();
    // }
  }
}
