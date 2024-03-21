
import '../resources/api_constant.dart';

String generateFullFileUrl(String? endpoint) {
  if (endpoint == null) {
    return 'Invalid endpoint';
  }
  String baseUrl = ApiUrls.baseUrl;
  if (endpoint.startsWith('http://') || endpoint.startsWith('https://')) {
    // If endpoint already contains the full URL, return it as is
    // print("Url ... http:// $endpoint");
    return endpoint;
  } else if (baseUrl.endsWith('/') && endpoint.startsWith('/')) {
    // Remove extra slashes between baseUrl and endpoint
    // print("Url ... / ${baseUrl + endpoint.substring(1)}");
    return baseUrl + endpoint.substring(1);
  } else if (!baseUrl.endsWith('/') && !endpoint.startsWith('/')) {
    // Add a slash between baseUrl and endpoint
    // print("Url ... !/ $baseUrl/$endpoint");
    return '$baseUrl/$endpoint';
  } else {
    // Simply concatenate baseUrl and endpoint
    // print("Url ... $baseUrl$endpoint");
    return '$baseUrl$endpoint';
  }
}
