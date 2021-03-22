import 'package:flutter/material.dart';
import '_model.dart';

class enterIntent extends Intent {
  const enterIntent();
}

class enterAction extends Action<enterIntent> {

  enterAction(this.model, this.context);

  final Model model;
  final BuildContext context;

  @override
  void invoke(covariant enterIntent intent) {
    print('AQUI');
    model.enter(context);
  }
}