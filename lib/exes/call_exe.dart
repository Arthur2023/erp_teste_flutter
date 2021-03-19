import 'dart:convert';
import 'dart:io';

const String path = "C:\\Users\\hullk\\Desktop\\Codigos\\PrecisaCods\\Call_exe";
const String exe = "call_exe.exe";


Future<Map<String, dynamic>> exec() async {
  String response;
  ProcessResult result = await Process.run(
    path + "\\" + exe,
    ['/request/ping', jsonEncode({})],
  );
  print(result.stdout);
  response = result.stdout.toString();
  return jsonDecode(response);
}
