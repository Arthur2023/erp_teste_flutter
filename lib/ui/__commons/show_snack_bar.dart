import 'package:flutter/material.dart';

showSnackBar({
  @required String text,
  BuildContext context,
  GlobalKey<ScaffoldState> scaffoldKey,
  Color color = Colors.green,
  Duration duration,
  double height = 30,
}) {
  if (duration == null) duration = Duration(milliseconds: 5000);
  Widget snack = SnackBar(
    behavior: SnackBarBehavior.fixed,
    elevation: 1000,
    content: Text(text),
    backgroundColor: color,
    duration: duration,
  );
    ScaffoldMessenger.of(context).showSnackBar(snack);
}
