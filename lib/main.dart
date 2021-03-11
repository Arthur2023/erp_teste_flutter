import 'package:erp_tela_flutter/app_screen.dart';
import 'package:erp_tela_flutter/managers/app_manager.dart';
import 'package:erp_tela_flutter/ui/_commons/collapsing_navigation_drawer/custom_navigation_drawer.dart';
import 'package:erp_tela_flutter/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:desktop_window/desktop_window.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  // await DesktopWindow.setWindowSize(Size(1100,600));
  // await DesktopWindow.setMinWindowSize(Size(1100,600));
  // await DesktopWindow.setMaxWindowSize(Size(1100,600));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(
        create: (_) => AppManager(),
    lazy: false,
    ),
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: selectedColor
      ),
      home: LoginScreen(),
    ),);
  }
}

