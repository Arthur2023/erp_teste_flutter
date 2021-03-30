import 'dart:convert';
import 'dart:io';

import 'package:erp_tela_flutter/models/order.dart';

class ChangeStateOrder {

  String path =
      "C:\\Users\\hullk\\Desktop\\Precisa Cods\\change_status_order\\build\\windows\\runner\\Release";
  String exe = "change_status_order.exe";


  Future<Order> exec(Order o) async {

    try {
      String map = jsonEncode(o.toMap());
      print(map + " =====> Mapa enviado");
      ProcessResult result = await Process.run(
        path + "\\" + exe,
        [map],
      );
      if(result.stdout == null)
        return null;
      print(result.stdout);
      return Order.fromMap(jsonDecode(result.stdout));
    }catch(e){
      return null;
    }
  }
}
