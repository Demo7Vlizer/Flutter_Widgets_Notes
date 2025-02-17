class ApiUrlBuilder {
  static const String baseUrl = 'https://api.flutter.dev/flutter/';

  static String buildUrl(String href) {
    final url = baseUrl + href;
    print('Opening URL: $url');
    return url;
  }
} 