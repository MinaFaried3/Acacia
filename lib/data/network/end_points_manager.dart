import 'dart:io';

import 'package:acacia/app/config/flavors/app_config.dart';

class EndPointsManager {
  // static const String baseUrl = "https://10.0.2.2:7095/api";
  // static const String baseUrl = "https://localhost:7095/api";
  static const String baseDevUrl = "https://uat.api.speedserviceapp.com";
  static const String baseProdUrl = "https://api.speedserviceapp.com";

  static const String _user = "/user";
  static const String _api = "/api";
  static const String _apiUser = "$_api/$_user";

  // user end points
  static const String loginRegisterResendOtp =
      "$_apiUser/loginRegisterResendOtp";
  static const String otpVerify = "$_apiUser/otpVerify";
  static const String logout = '$_user/logout';
  static const String destroyEmail = '$_user/destroyme';

  // offers
  static const String offers = '$_user/offers';
  static const String offerByID = '$_user/offers/{id}';

  // services
  static const String services = '$_user/services';
  static const String subscriptions = '$_user/subscriptions';
  static const String subscriptionsView = '$subscriptions/{id}';
  static const String userSubscriptions = '$_user/user-subscriptions';
  static const String userSubscriptionsView = '$userSubscriptions/{id}';
  static const String userSubscriptionsServices =
      '$_user/user-subscription-services';
  static const String userSubscriptionsServicesView =
      '$userSubscriptionsServices/{id}';

  // cart
  static const String cart = '$_user/carts';
  static const String emptyCart = '$cart/empty';

  static const String destroyCart = '$cart/{id}';

  static const String destroyCartByUserCarId =
      '$cart/destroy-by-user-car-id/{id}';

  static const String userWorkingTime = '$_user/working-time';
  static const String userCartScheduled = '$_user/user-cart-scheduled';

  //cars
  static const String usersCars = "$_user/usercars";
  static const String usersCarsById = "$usersCars/{id}";
  static const String editUsersCarsById = "$usersCarsById/edit";

  //location
  static const String locations = "$_user/locations";
  static const String updateLocation = "$locations/{id}";
  static const String deleteLocation = "$locations/{id}/toggleActive/false";
  static const String defaultLocation = "$_user/users/default-location";

  static const String cars = "$_user/cars";

  // profile
  static const String profileById = "$_user/users/{id}";

  // order
  static const String orders = "$_user/orders";
  static const String reorder = "$orders/{id}/reorder";
  static const String orderById = "$orders/{id}";
  static const String ordersByCar = "$orders/user-cars";
  static const String rateOrder = "$orders/rate";
  static const String ordersByCarById = "$ordersByCar/{id}";

  //notification
  static const String notifications = "$_user/notifications";
  static const String haveNewNotifications = "$_user/is-new-notifications";

  //files
  static const String uploadFile = "$_user/uploadFile";

  //payment
  static const String bankAccounts = "$_user/bankaccounts";
}

class HeadersManager {
  static const String contentType = "Content-Type";
  static const String applicationJson = "application/json";
  static const String accept = "Accept";
  static const String acceptLanguage = "Accept-Language";
  static const String authorization = "Authorization";
  static const String fcmToken = "fcm-token";
  static const String apnsToken = "APNs-token";
  static const String env = "env";
  static const String platform = "platform";
  static const String version = "version";
  static const String buildNumber = "build-number";
  static const String appId = "app-id";

  static const String ar = "so-SO";
  static const String en = "en-US";

  static const Map<String, String> jsonTypeHeader = {
    contentType: applicationJson,
  };
  //todo  headers
  static Future<Map<String, String>> baseHeaders(
    String lang,
    String token,
  ) async => {
    accept: applicationJson,
    authorization: "Bearer $token",
    acceptLanguage: lang,
    fcmToken: 'await AppNotificationService.getDeviceToken()',
    if (Platform.isIOS)
      apnsToken: 'await AppNotificationService.getIOSAPNsToken()',
    env: AppConfig.instance.flavor.name,
    platform: Platform.isIOS ? 'IOS' : 'Android',
    version: 'getIt<PackageInfo>().version',
    buildNumber: 'getIt<PackageInfo>().buildNumber',
    appId: ' getIt<PackageInfo>().packageName',
  };
}
