//http://18.228.120.34:8022/request/navios?codigoEmpresa=1&uid=SyNw6TB5IqYqNJhOoWdUR93o4Ao2&segmento=1

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WsExecute {
  static final WsExecute _singleton = WsExecute._internal();

  factory WsExecute() {
    return _singleton;
  }

  WsExecute._internal();

  String url = "http://18.228.120.34:8022";

  Future<Map<String, dynamic>> executeDb({@required String query, String json = "", Duration duration = const Duration(days: 1)}) async {
    String returnValue;
    String currentUrl = url + query;
Uri uri = Uri().resolve(currentUrl);
    await http
        .post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: json,
    )
        .timeout(duration)
        .then((http.Response response) {
      returnValue = utf8.decode(response.bodyBytes);
    });
    return jsonDecode(returnValue);
  }
}

// Map<String, dynamic> json = await executeWS.executeDb(
// query: "/request/notasAssinada"
// "?codigoEmpresa=$codigoEmpresa"
// "&uid=$uid"
// "&segmento=$segmento",
// );



