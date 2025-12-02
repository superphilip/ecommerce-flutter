import 'dart:core';



Uri buildUri(String baseUrl, String path, [Map<String, String>? queryParameters]) {
  
  var base = baseUrl.trim();
  if (!base.startsWith('http://') && !base.startsWith('https://')) {
    base = 'http://$base';
  }

  
  if (base.endsWith('/')) {
    base = base.substring(0, base.length - 1);
  }

  final full = path.startsWith('/') ? '$base$path' : '$base/$path';
  return Uri.parse(full).replace(queryParameters: queryParameters);
}


Map<String, String> defaultJsonHeaders() => const {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };


Future<Map<String, String>> buildHeadersAsync(
  Future<String> Function() getToken, {
  Map<String, String>? baseHeaders,
}) async {
  final token = await getToken();
  final headers = <String, String>{
    if (baseHeaders != null) ...baseHeaders,
  };
  if (token.trim().isNotEmpty) {
    headers['Authorization'] = token;
  }
  return headers;
}