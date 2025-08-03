enum Flavor { dev, prod }

extension FlavorExtension on Flavor {
  bool get isDev => this == Flavor.dev;
  bool get isProd => this == Flavor.prod;
}
