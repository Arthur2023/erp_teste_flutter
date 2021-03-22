import 'package:flutter/material.dart';
import '_model.dart';

class CloseActualContextIntent extends Intent {
  const CloseActualContextIntent();
}

class CloseActualContextAction extends Action<CloseActualContextIntent> {

  CloseActualContextAction(this.model, this.context);

  final Model model;
  final BuildContext context;

  @override
  void invoke(covariant CloseActualContextIntent intent) {
    model.closeActualContext(context);
  }
}