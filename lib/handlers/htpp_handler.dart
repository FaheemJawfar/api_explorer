import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> makeGetRequest(String url) async {
  return await http.get(Uri.parse(url));
}

Future<http.Response> makePostRequest(String url, dynamic body) async {
  return await http.post(Uri.parse(url), body: jsonEncode(body));
}

Future<http.Response> makePutRequest(String url, dynamic body) async {
  return await http.put(Uri.parse(url), body: jsonEncode(body));
}

Future<http.Response> makeDeleteRequest(String url) async {
  return await http.delete(Uri.parse(url));
}
