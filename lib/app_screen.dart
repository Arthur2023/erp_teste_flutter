import 'package:erp_tela_flutter/managers/app_manager.dart';
import 'package:erp_tela_flutter/ui/_commons/collapsing_navigation_drawer/commons/collapsing_navigation_drawer_widget.dart';
import 'package:erp_tela_flutter/ui/home/home_screen.dart';
import 'package:erp_tela_flutter/ui/info/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo_precisa.jpg"),
                    fit: BoxFit.cover
                )
            ),
          ),
          backgroundColor: Colors.white,
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 550,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  IconButton(
                      icon:
                      Icon(Icons.announcement_outlined, color: Colors.grey),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.notifications_none, color: Colors.grey),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.account_circle_outlined,
                          color: Colors.grey),
                      onPressed: () {})
                ],
              ),
            )
          ],
        ),
        body: Stack(
          children: <Widget>[
            Consumer<AppManager>(
              builder: (_,appManager,__) {
                return PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: appManager.pageController,
                  children: [
                    HomeScreen(),
                    InfoScreen(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                );
              }
            ),
           CollapsingNavigationDrawer()
          ],
        ));
  }
}
