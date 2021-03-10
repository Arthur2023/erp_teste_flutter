import 'package:erp_tela_flutter/ui/_commons/collapsing_navigation_drawer/commons/collapsing_navigation_drawer_widget.dart';
import 'package:erp_tela_flutter/ui/home/cards/card_flow.dart';
import 'package:erp_tela_flutter/ui/home/cards/card_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'cards/card_central.dart';
import 'cards/card_donut.dart';
import 'cards/card_row.dart';
import 'cards/card_calendar.dart';

class HomeScreen extends StatelessWidget {
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
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 75, top: 53),
                child: StaggeredGridView.countBuilder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                    shrinkWrap: true,
                    crossAxisCount: 8,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemCount: 6,
                    itemBuilder: (_, index) {
                      if (index == 0) {
                        return Card1(
                        );
                      } else if (index == 1) {
                        return CardCalendar(
                        );
                      } else if (index == 2) {
                        return CardCentral(
                        );
                      } else if (index == 3) {
                        return CardFlow(
                        );
                      } else if (index == 4) {
                        return CardDonut(
                        );
                      } else if (index == 5) {
                        return CardListView(
                        );
                      }
                      return null;
                    },
                    staggeredTileBuilder: (index) {
                      if (index == 0) {
                        return StaggeredTile.count(6, 0.75);
                      } else if (index == 1) {
                        return StaggeredTile.count(2, 3.75);
                      } else if (index == 2) {
                        return StaggeredTile.count(6, 1.5);
                      } else if (index == 3) {
                        return StaggeredTile.count(2, 1.5);
                      } else if (index == 4) {
                        return StaggeredTile.count(2, 1.5);
                      } else if (index == 5) {
                        return StaggeredTile.count(2, 1.5);
                      } else {
                        return StaggeredTile.count(1, 1);
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 5),
              child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 500,
                          child: Row(
                            children: [
                              Text(
                                "Dia",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Text(
                                  "Semana",
                                  style: TextStyle(
                                      color: Colors.blue[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "Mês",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: Text(
                                  "Ano",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.add),
                              color: Colors.blue[800],
                              onPressed: () {}),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Add Widget",
                              style: TextStyle(
                                color: Colors.blue[800],
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  )),
            ),
            CollapsingNavigationDrawer()
          ],
        ));
  }
}
