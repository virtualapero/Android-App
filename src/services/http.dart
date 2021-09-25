import 'package:http/http.dart' as http;

class HttpService {

  String host = "http://virtualapero.de/";

  Future<http.Response> get(String path) {
    var url = Uri.parse('$host$path');
    return http.get(url);
  }

}