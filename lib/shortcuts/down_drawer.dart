import 'package:flutter/material.dart';
import '_model.dart';

class DownDrawerIntent extends Intent {
  const DownDrawerIntent();
}

class DownDrawerAction extends Action<DownDrawerIntent> {

  DownDrawerAction(this.model, this.context);

  final Model model;
  final BuildContext context;

  @override
  void invoke(covariant DownDrawerIntent intent) {
    model.downDrawer(context);
  }
}