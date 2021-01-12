import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:retail_demo/src/data/app_exception.dart';

class retail_demoApiProvider {
  final String baseUrl = "https://reqres.in/api/";

  Future<dynamic> post(String url, Map input) async {
    var responseJson;
    try {
      // headers: {"Content-Type": "application/json"},
      final response = await http.post(baseUrl + url, body: input);
      responseJson = inspectResponse(response);
    } on SocketException {
      throw FetchDataException("No Conection");
    }
    return responseJson;
  }

  Future<dynamic> get(String url, Map input) async {
    var responseJson;
    try {
      final response = await http.get(baseUrl + url);
      responseJson = inspectResponse(response);
    } on SocketException {
      throw FetchDataException("No Conection");
    }
    return responseJson;
  }

  dynamic inspectResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnAuthorizedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
