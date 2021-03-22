import 'package:flutter/material.dart';
import '_model.dart';

class OpenCreateOrderIntent extends Intent {
  const OpenCreateOrderIntent();
}

class OpenCreateOrderAction extends Action<OpenCreateOrderIntent> {

  OpenCreateOrderAction(this.model, this.context);

  final Model model;
  final BuildContext context;

  @override
  void invoke(covariant OpenCreateOrderIntent intent) {
    model.openCreateOrder(context);
  }
}