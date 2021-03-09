import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Dashboard", icon: Icons.insert_chart_outlined),
  NavigationModel(title: "Errors", icon: Icons.error_outline),
  NavigationModel(title: "Search", icon: Icons.search),
  NavigationModel(title: "Notifications", icon: Icons.notifications_none),
  NavigationModel(title: "Settings", icon: Icons.settings),
];