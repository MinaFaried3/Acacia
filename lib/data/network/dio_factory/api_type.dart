import 'package:acacia/app/config/flavors/app_config.dart';

enum ApiType { primary, maps }

extension ApiTypeExtension on ApiType {
  String get baseUrl {
    switch (this) {
      case ApiType.primary:
        return AppConfig.instance.baseAPI;
      case ApiType.maps:
        return '';
    }
  }

  String get description {
    switch (this) {
      case ApiType.primary:
        return "Primary API for main application data";
      case ApiType.maps:
        return "Google Maps API for location-based services";
    }
  }

  bool get isPrimary => this == ApiType.primary;
  bool get isMaps => this == ApiType.maps;
}
