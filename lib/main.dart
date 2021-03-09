import 'package:erp_tela_flutter/ui/_commons/collapsing_navigation_drawer/custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

import 'ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: selectedColor
      ),
      home: HomeScreen(),
    );
  }
}

