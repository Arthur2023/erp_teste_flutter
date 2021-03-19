import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WebServiceController {
  static final WebServiceController _instance = WebServiceController.internal();

  factory WebServiceController() => _instance;

  WebServiceController.internal();

//  String url = "http://192.168.0.33:8090";
  String url = "http://18.228.120.34:8015";

  Future<Map<String, dynamic>> get({
    @required String query,
    Duration duration,
  }) async {
    if(duration == null)duration = const Duration(seconds: 10);
    try {
      String returnValue;
      String currentUrl = url + query;
      print(currentUrl);
      Uri uri = Uri().resolve(currentUrl);
      await Future.delayed(Duration(milliseconds: 100));
      await http
          .get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      )
          .timeout(duration)
          .then(
            (http.Response response) {
          returnValue = utf8.decode(response.bodyBytes);
        },
      );

      return jsonDecode(returnValue);
    } catch (e) {
      return {'connection': e.toString()};
    }
  }

  Future<Map<String, dynamic>> post({
    @required String query,
    @required Map<String, dynamic> body,
    Duration duration = const Duration(seconds: 10),
  }) async {
    try {
      String returnValue;
      String currentUrl = url + query;
      print(currentUrl);
      Uri uri = Uri().resolve(currentUrl);
      await Future.delayed(Duration(milliseconds: 100));
      await http
          .post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(body ?? {}),
      )
          .timeout(duration)
          .then(
            (http.Response response) {
          returnValue = utf8.decode(response.bodyBytes);
        },
      );

      return jsonDecode(returnValue);
    } catch (e) {
      return {'connection': e.toString()};
    }
  }

  Future<Map<String, dynamic>> put({
    @required String query,
    @required Map<String, dynamic> body,
    Duration duration = const Duration(seconds: 10),
  }) async {
    try {
      String returnValue;
      String currentUrl = url + query;
      print(currentUrl);
      Uri uri = Uri().resolve(currentUrl);
      await Future.delayed(Duration(milliseconds: 100));
      await http
          .put(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(body),
      )
          .timeout(duration)
          .then(
            (http.Response response) {
          returnValue = utf8.decode(response.bodyBytes);
        },
      );

      return jsonDecode(returnValue);
    } catch (e) {
      return {'connection': e.toString()};
    }
  }

  Future<Map<String, dynamic>> delete({
    @required String query,
    String body = "",
    Duration duration = const Duration(seconds: 10),
  }) async {
    try {
      String returnValue;
      String currentUrl = url + query;
      print(currentUrl);
      Uri uri = Uri().resolve(currentUrl);
      await Future.delayed(Duration(milliseconds: 100));
      await http
          .delete(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      )
          .timeout(duration)
          .then(
            (http.Response response) {
          returnValue = utf8.decode(response.bodyBytes);
        },
      );

      return jsonDecode(returnValue);
    } catch (e) {
      return {'connection': e.toString()};
    }
  }

  Future<bool> testConnection() async {
    Map<String, dynamic> json = await get(query: "/controller/ping", duration: Duration(seconds: 5));
    if (json.containsKey('connection') || json.containsKey('error')) return false;
    return true;
  }
}
