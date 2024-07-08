import 'dart:convert';
import 'package:http/http.dart' as http;

enum RequestMethod { get, post, put, delete }

class HttpService {

  late http.Client client;

  HttpService() : client = http.Client();

  
  final baseUrl = "https://6683f3cb56e7503d1adecefb.mockapi.io/api";

  request(
      {required RequestMethod method,
      required String url,
      Map<String, dynamic>? body}) async {
    try {
      http.Response response;

      final uri = Uri.parse(baseUrl + url);

      final headers = {'content-type': 'application/json'};

      switch (method) {
        case RequestMethod.get:
          response = await client.get(uri);
        case RequestMethod.post:
          response =
              await client.post(uri, body: jsonEncode(body), headers: headers);
        case RequestMethod.put:
          response =
              await client.put(uri, body: jsonEncode(body), headers: headers);
        case RequestMethod.delete:
          response = await client.delete(uri);
      }

      if (response.statusCode > 400) {
        throw Exception('Http status code was ${response.statusCode}');
      }


      return jsonDecode(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
