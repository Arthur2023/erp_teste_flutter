import 'dart:convert';

import 'package:flutter/material.dart';
import '_model.dart';

class OpenDrawerIntent extends Intent {
  const OpenDrawerIntent();
}

class OpenDrawerAction extends Action<OpenDrawerIntent> {



  OpenDrawerAction(this.model, this.context) {
    print("AQUII instance");
  }

  final Model model;
  final BuildContext context;


  @override
  void invoke(covariant OpenDrawerIntent intent) {
    print("AQUII");
    model.openDrawer(context);
  }
}