import 'package:flutter/material.dart';
import '_model.dart';

class OpenCreateClientIntent extends Intent {
   OpenCreateClientIntent(){
    print('AQUII instance intent');
  }
}

class OpenCreateClientAction extends Action<OpenCreateClientIntent> {

  OpenCreateClientAction(this.model, this.context){
    print("AQUII instance");
  }

  final Model model;
  final BuildContext context;

  @override
  void invoke(covariant OpenCreateClientIntent intent) {
    print('AQUI');
    model.openCreateClient(context);
  }

   void invoke2(covariant OpenCreateClientIntent intent) {
    print('AQUI');
    model.openCreateClient(context);
  }
}