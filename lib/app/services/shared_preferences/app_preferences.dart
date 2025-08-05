import 'package:acacia/app/services/localization/language_manager.dart';
import 'package:acacia/app/services/shared_preferences/shared_pref_keys.dart';
import 'package:acacia/app/shared/common/constants.dart';
import 'package:acacia/presentation/resources/routes/route_data.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class AppPreferences extends Equatable {
  final Box _hiveBox;
  final FlutterSecureStorage _secureStorage;

  const AppPreferences({
    required Box hiveBox,
    required FlutterSecureStorage secureStorage,
  }) : _hiveBox = hiveBox,
       _secureStorage = secureStorage;

  //General Methods
  Future<void> setData<T>({required String key, required T data}) async {
    switch (data.runtimeType) {
      case const (String):
        await _hiveBox.put(key, data as String);
        break;
      case const (double):
        await _hiveBox.put(key, data as double);
        break;
      case const (int):
        await _hiveBox.put(key, data as int);
        break;
      case const (bool):
        await _hiveBox.put(key, data as bool);
        break;
      default:
        await _hiveBox.put(key, data);
    }
  }

  Future<bool> getBool(String key) async {
    bool? result = await _hiveBox.get(key) as bool?;
    return result ?? false;
  }

  String getString(String key) {
    String? result = _hiveBox.get(key) as String?;
    return result ?? AppConstants.emptyString;
  }

  int getInt(String key) {
    int? result = _hiveBox.get(key) as int?;
    return result ?? 0;
  }

  double getDouble(String key) {
    double? result = _hiveBox.get(key) as double?;
    return result ?? 0.0;
  }

  // Language
  Future<String> getAppLanguage() async {
    String? lang = _hiveBox.get(PrefKeys.lang) as String?;

    //default if null or empty
    if (lang == null || lang.isEmpty) {
      return AppConstants.defaultLang.getLangWithCountry();
    }

    return lang.isNotEmpty == true
        ? lang
        : LanguageType.english.getLangWithCountry();
  }

  Future<void> setAppLanguage(LanguageType? type) async => _hiveBox.put(
    PrefKeys.lang,
    type?.getLangWithCountry() ?? LanguageType.english.getLangWithCountry(),
  );

  // Check if user is logged in
  Future<String> isUserLoggedIn() async {
    String? token = _hiveBox.get(PrefKeys.token) as String?;

    //default if null or empty
    if (token == null || token.isEmpty) {
      return AppConstants.emptyString;
    }

    return token.isNotEmpty == true ? token : AppConstants.emptyString;
  }

  Future<RouteData> getOpeningRoutePath() async {
    // Check if the user is logged in
    return Routes.undefined;
    // String tokenString = await token;
    // bool isLoggedIn = await getBool(PrefKeys.isLoggedIn);
    // bool isDoneOnboarding = await getBool(PrefKeys.isDoneOnboardingScreen);
    // PrintManager.print(
    //   "isLogged In = $isLoggedIn",
    //   color: ConsoleColor.brightBlackBg,
    // );
    // PrintManager.print(
    //   "is done onBoarding = $isDoneOnboarding",
    //   color: ConsoleColor.brightBlackBg,
    // );
    // PrintManager.print(
    //   "token = $tokenString",
    //   color: ConsoleColor.brightBlackBg,
    // );
    //
    // if (isLoggedIn && tokenString.isNotEmpty) {
    //   AppLogger().warning('I had run');
    //   return Routes.mainRoute;
    // }
    //
    // // Check if the user has completed the onboarding process
    // if (isDoneOnboarding == false) {
    //   AppLogger().warning('I had run');
    //   return Routes.onboardingRoute;
    // }
    //
    // // If onboarding is done, but the token is missing, navigate to login
    // if (tokenString.isEmpty || isLoggedIn.isFalse) {
    //   AppLogger().warning('I had run');
    //   return Routes.loginRoute;
    // }
    //
    // // Default fallback if no other conditions are met
    // // return Routes.unDefined;
    // return Routes.loginRoute;
  }

  // Save auth data
  Future<void> setToken({required String token}) async {
    await _secureStorage.write(key: PrefKeys.token, value: token);
  }

  // Save auth data
  Future<void> deleteToken() async {
    await _secureStorage.delete(key: PrefKeys.token);
  }

  // Future<String> get token async =>
  //     (await _secureStorage.read(key: PrefKeys.token)).orEmpty();
  //
  // Future<void> saveMainUserData({required UserModel userModel}) async {
  //   // await saveTokensData(tokens: userModel.tokens);
  //   await setData<String>(key: PrefKeys.userId, data: userModel.id!);
  // }

  String get userId {
    return getString(PrefKeys.userId);
  }

  Future<String?> getUserData() async => (getString(PrefKeys.userId));

  @override
  List<Object> get props => [_hiveBox];
}
