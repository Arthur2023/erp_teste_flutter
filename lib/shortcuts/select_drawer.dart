import 'package:flutter/material.dart';
import '_model.dart';

class SelectDrawerIntent extends Intent {
  const SelectDrawerIntent();
}

class SelectDrawerAction extends Action<SelectDrawerIntent> {

  SelectDrawerAction(this.model, this.context);

  final Model model;
  final BuildContext context;

  @override
  void invoke(covariant SelectDrawerIntent intent) {
    model.selectDrawer(context);
  }
}