import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

const String path = "C:\\Users\\hullk\\Desktop\\Codigos\\PrecisaCods\\My_app";
const String exe = "my_app.exe";

Future<Map<String, dynamic>> exec({@required String query, String json, Duration duration = const Duration(days: 1)}) async {
  String response;
  ProcessResult result = await Process.run(
    path + "\\" + exe,
    [query, jsonEncode(json?? {})],

  );
  print(result.stdout);
  response = result.stdout.toString();
  print("response : " + response);
  return jsonDecode(response);
}
