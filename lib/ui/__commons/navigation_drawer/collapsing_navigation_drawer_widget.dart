import 'package:erp_tela_flutter/managers/app_manager.dart';
import 'package:erp_tela_flutter/ui/__commons/navigation_drawer/collapsing_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/navigation_model.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 190;
  double minWidth = 55;
  AnimationController _animationController2;
  Animation<double> widthAnimation2;
  int currentSelectedInde = 0;

  @override
  void initState() {
    super.initState();
    _animationController2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation2 = Tween<double>(begin:minWidth , end:maxWidth)
        .animate(_animationController2);

    context.read<AppManager>().initializeControllers(_animationController2, widthAnimation2);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: context.watch<AppManager>().animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
      child: Consumer<AppManager>(
        builder: (_,appManager,__) {
          return Container(
            width: appManager.widthAnimation.value,
            color: Colors.blue[900],
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, counter) {
                      return Divider(
                        height: 12.0,
                        color: Colors.blue[900],
                      );
                    },
                    itemBuilder: (context, counter) {
                      return CollapsingListTile(
                        onTap: () {
                          setState(() {
                            appManager.currentSelectedIndex = counter;
                            print("Counter ==> $counter");
                          });
                          context.read<AppManager>().jumpToPage(counter);
                        },
                        isSelected: appManager.currentSelectedIndex == counter,
                        title: navigationItems[counter].title,
                        icon: navigationItems[counter].icon,
                        animationController: appManager.animationController,
                      );
                    },
                    itemCount: navigationItems.length,
                  ),
                ),
                InkWell(
                  onTap: () {
                      appManager.changeCollapsed();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: AnimatedIcon(
                      icon: AnimatedIcons.arrow_menu,
                      progress: appManager.animationController,
                      color: Colors.grey[100],
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
