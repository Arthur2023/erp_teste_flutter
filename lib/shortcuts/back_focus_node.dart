import 'package:flutter/material.dart';
import '_model.dart';

class BackFocusScopeIntent extends Intent {
  const BackFocusScopeIntent();
}

class BackFocusScopeAction extends Action<BackFocusScopeIntent> {

  BackFocusScopeAction(this.model, this.context);

  final Model model;
  final BuildContext context;

  @override
  void invoke(covariant BackFocusScopeIntent intent) {
    model.backFocusScope(context);
  }
}