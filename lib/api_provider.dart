import 'package:flutter_api_provider/album.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

extension Success on http.Response {
  bool get isSuccess => statusCode == 200;
}

abstract class APIProvider {
  String get baseUrl => "https://jsonplaceholder.typicode.com";
  String get apiUrl;
  String get url => baseUrl + apiUrl;
  Future<List<Todos>> fetch({String endPoint = ''}) async {
    var response = await http.get(Uri.parse(url + endPoint));
    if (response.isSuccess) {
      final json = await jsonDecode(response.body) as List;
      return json.map((e) => Todos.fromMap(e)).toList();
    }
    return [];
    // return throw Exception('Failed to load album');
  }
}
