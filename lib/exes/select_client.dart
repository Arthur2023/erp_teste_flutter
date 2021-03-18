import 'dart:convert';
import 'dart:io';
import 'package:erp_tela_flutter/models/client.dart';

class SelectClient {

  String path =
      "C:\\Users\\hullk\\Desktop\\Precisa Cods\\flutter_app_list_clients\\build\\windows\\runner\\Release";
  String exe = "flutter_app_list_clients.exe";

  exec() async {
    Client client = Client("","","","","");
    ProcessResult result = await Process.run(
      path + "\\" + exe,
      []
    );
    print(result.stdout + " 000");
    Map<String, dynamic> map = jsonDecode(result.stdout);
    client = Client.fromDocument(map);
    print(client.name + " , " + client.company);
    return client;
  }

}
