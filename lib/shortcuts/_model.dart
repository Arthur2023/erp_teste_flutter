import 'package:erp_tela_flutter/managers/app_manager.dart';
import 'package:erp_tela_flutter/ui/order/components/create_order.dart';
import 'package:erp_tela_flutter/ui/register/components/create_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      if (nodes[0].hasFocus) {
        print('0 TEM FOCO');
        if(nodes2.length > 0){
          nodes2[2].requestFocus();}
        else return;
      }
      else if (nodes[i].hasFocus) {
        print(i - 1);
        nodes[i - 1].requestFocus();
        print("Saiu");
        break;
      }
      if(nodes2.isEmpty)
        continue;
      else if (nodes2[0].hasFocus) {
        nodes[0].requestFocus();
      }
      else if (nodes2[2].hasFocus) {
        closeActualContext(context);
      }
      else if (nodes2[1].hasFocus) {
        nodes2[0].requestFocus();
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
  if(nodes[2].hasFocus){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AppScreen()));
  }
}

void openDrawer(BuildContext context){
    print("Cheguei até a função");
    context.read<AppManager>().changeCollapsed();
    print("Realizei");
}

void downDrawer(BuildContext context){
  context.read<AppManager>().changeCurrentSelectedIndex(-1);
}

void upDrawer(BuildContext context){
  context.read<AppManager>().changeCurrentSelectedIndex(1);
}

void selectDrawer(BuildContext context){
  context.read<AppManager>().jumpToPage(context.read<AppManager>().currentSelectedIndex);
}

}
