enum Flavor {
  dev,
  stg,
  prd,
}

class F {
  static late Flavor appFlavor;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://api.dev.com';
      case Flavor.stg:
        return 'https://api.staging.com';
      case Flavor.prd:
        return 'https://api.prod.com';
      default:
        return '';
    }
  }
}
