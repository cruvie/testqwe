import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;


class Request {
  Future request(
      String path, Map<String, dynamic> queryParameters, String method) async {

    String authority = '127.0.0.1:8756';

    var url = Uri.http(authority, path, queryParameters);
    late http.Response response;
    Map<String, String> header = {
      "Content-Type": "application/json"
    };

    if (method == 'get') {
      response = await http.get(url, headers: header);
    } else if (method == 'post') {
      response = await http.post(url, headers: header);
    }
    debugPrint(response.body);

  }

  Future get(String path, {Map<String, dynamic> queryParameters = const {}}) {
    return request(path, queryParameters, 'get');
  }
}
