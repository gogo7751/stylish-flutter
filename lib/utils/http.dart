import 'package:http/http.dart' as http;

class HttpClient {
  static final HttpClient _singleton = HttpClient._internal();

  factory HttpClient() {
    return _singleton;
  }

  late http.Client _client;

  HttpClient._internal() {
    _client = http.Client();
  }

  http.Client get client => _client;
}
