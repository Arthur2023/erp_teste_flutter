import 'package:erp_tela_flutter/ui/order/components/create_order.dart';
import 'package:erp_tela_flutter/ui/register/components/create_client.dart';
import 'package:flutter/material.dart';

import '../app_screen.dart';

class Model with ChangeNotifier {

  List<FocusNode> nodes = [];
  List<FocusNode> nodes2 = [];

  Model(this.nodes, this.nodes2);


  void closeActualContext(BuildContext context) {
    Navigator.pop(context);
  }

  void backFocusScope(BuildContext context) {
    for (int i = 0; i < nodes.length; i++) {
      if (nodes[i].hasFocus && i == 0) {
        nodes2[2].requestFocus();
      }
      else if (nodes[i].hasFocus) {
        print(i - 1);
        nodes[i - 1].requestFocus();
        print("Saiu");
        break;
      }
      else if (nodes2[0].hasFocus) {
        nodes[0].requestFocus();
      }
      else if (nodes2[2].hasFocus) {
        closeActualContext(context);
      }
    }
  }

void openCreateClient(BuildContext context) {
  print('CHEGUEI ATÉ OPEN');
  showDialog(
      context: context,
      builder: (context2) => CreateClient());
}

void openCreateOrder(BuildContext context) {
  showDialog(
      context: context,
      builder: (context2) => CreateOrder());
}

void enter(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AppScreen()));
}

}
