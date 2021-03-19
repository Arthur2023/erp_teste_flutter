import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}


List<NavigationModel> navigationItems = [
  NavigationModel(title: "Painel", icon: Icons.insert_chart_outlined,),
  NavigationModel(title: "Conexões", icon: Icons.connected_tv),
  NavigationModel(title: "Clientes", icon: Icons.supervised_user_circle_outlined),
  NavigationModel(title: "Pedidos", icon: Icons.request_page_outlined),
  NavigationModel(title: "Settings", icon: Icons.settings),
];