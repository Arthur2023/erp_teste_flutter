import 'package:erp_tela_flutter/ui/_commons/collapsing_navigation_drawer/commons/collapsing_navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: Text("simbolo precisa",
              style: TextStyle(
                color: Colors.blue,
              )),
          backgroundColor: Colors.white,
          title: Container(
            width: 550,
            child: Row(
              children: [
                Expanded(
                  child: TextField(),
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
                padding: const EdgeInsets.only(left:60, top: 10),
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
                        return Card();
                      } else if (index == 1) {
                        return Card();
                      } else if (index == 2) {
                        return Card();
                      } else if (index == 3) {
                        return Card();
                      } else if (index == 4) {
                        return Card();
                      } else if (index == 5) {
                        return Card();
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
                        return StaggeredTile.count(1, 1);
                      } else if (index == 4) {
                        return StaggeredTile.count(2, 1);
                      } else if (index == 5) {
                        return StaggeredTile.count(2, 1.5);
                      } else {
                        return StaggeredTile.count(1, 1);
                      }
                    }),
              ),
            ),
            CollapsingNavigationDrawer()
          ],
        ));
  }
}
