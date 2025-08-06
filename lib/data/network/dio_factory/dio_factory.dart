import 'package:acacia/app/config/app_mode.dart';
import 'package:acacia/app/services/localization/language_manager.dart';
import 'package:acacia/app/services/shared_preferences/app_preferences.dart';
import 'package:acacia/app/shared/common/constants.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/data/network/end_points_manager.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_type.dart';

class DioFactory extends Equatable {
  final AppPreferences _appPreferences;
  final Dio _dio;
  final ApiType apiType;

  const DioFactory({
    required AppPreferences appPreferences,
    required Dio dio,
    this.apiType = ApiType.primary,
  }) : _appPreferences = appPreferences,
       _dio = dio;

  Future<String> getLanguage() async {
    return await _appPreferences.getAppLanguage();
  }

  Future<Dio> get dio async {
    await refreshDioOptionsWithToken();
    _addInterceptors();
    return _dio;
  }

  void _addInterceptors() {
    _addLoggingInterceptor();
    // _addAliceInterceptor();
  }

  void _addLoggingInterceptor() {
    if (AppMode.devMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          request: true,
          error: true,
          logPrint: printer,
        ),
      );
    }
  }

  // void _addAliceInterceptor() {
  //   if (AppMode.devMode && alice != null) {
  //     _dio.interceptors.add(alice!.getDioInterceptor());
  //   }
  // }

  Future<void> refreshDioOptionsWithToken() async =>
      _dio.options = await dioBaseOptions;

  Future<BaseOptions> get dioBaseOptions async {
    Map<String, String> headers = await baseHeaders;

    return BaseOptions(
      baseUrl: apiType.baseUrl,
      headers: headers,
      sendTimeout: DurationManager.apiTimeOut,
      receiveTimeout: DurationManager.apiTimeOut,
      receiveDataWhenStatusError: true,
    );
  }

  Future<Map<String, String>> get baseHeaders async {
    // get only the lang code without the country code
    String lang = (await _appPreferences.getAppLanguage())
        .split(LanguageType.langSeparator)
        .first;

    late Map<String, String> headers;

    if (apiType.isPrimary) {
      headers = await HeadersManager.baseHeaders(
        lang,
        '', // await _appPreferences.token,
      );
    } else {
      // headers = MapsHeader.mapsBaseHeaders(lang, MapsApiKey.placesApiKey);
    }

    return headers;
  }

  @override
  List<Object> get props => [_appPreferences, _dio];
}
