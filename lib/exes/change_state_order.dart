import 'dart:convert';
import 'dart:io';

import 'package:erp_tela_flutter/models/order.dart';

class ChangeStateOrder {

  String path =
      "C:\\Users\\hullk\\Desktop\\Precisa Cods\\change_status_order\\build\\windows\\runner\\Release";
  String exe = "change_status_order.exe";


  Future<Order> exec(Order o) async {

    print("\n\n\n\n\n\n ########################333");
    String map = jsonEncode(o.toMap());
print(map);
    ProcessResult result = await Process.run(
      path + "\\" + exe,
      [map],
    );
    print(result.stdout);
    return Order.fromMap(jsonDecode(result.stdout));
    print("\n\n\n\n\n\n ########################333");
  }
}
