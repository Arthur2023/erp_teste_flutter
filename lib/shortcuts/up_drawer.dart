import 'package:flutter/material.dart';
import '_model.dart';

class UpDrawerIntent extends Intent {
  const UpDrawerIntent();
}

class UpDrawerAction extends Action<UpDrawerIntent> {

  UpDrawerAction(this.model, this.context);

  final Model model;
  final BuildContext context;

  @override
  void invoke(covariant UpDrawerIntent intent) {
    model.upDrawer(context);
  }
}