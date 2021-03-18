import 'dart:async';


import 'package:erp_tela_flutter/managers/app_manager.dart';
import 'package:erp_tela_flutter/managers/client_manager.dart';
import 'package:erp_tela_flutter/ui/__commons/theme.dart';
import 'package:erp_tela_flutter/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(
        create: (_) => ClientManager(),
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

