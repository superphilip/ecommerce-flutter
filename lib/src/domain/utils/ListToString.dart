String listToString(dynamic data) {
  String message = '';
  if (message is List<dynamic>) {
    message = (data as List<dynamic>).join(' ');
  } else if (data is String) {
    message = data;
  }
  return message;
}
