import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

class CollapsingListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final AnimationController animationController;
  final bool isSelected;
  final bool isAbove;
  final bool isBelow;
  final Function onTap;

  CollapsingListTile({
    @required this.title,
    @required this.icon,
    @required this.animationController,
    this.isSelected = false,
    this.onTap,
    this.isAbove,
    this.isBelow,
  });

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double> widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 200, end: 70).animate(widget.animationController);
    sizedBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController);

    print(widget.title);
    print(widget.isAbove);
    print(widget.isBelow);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Column(
          children: [
            Container(
              height: 5,
              child: Stack(
                children: [
                  Container(height: 5,
                color:widget.isSelected ? Colors.white : Colors.transparent,),
                  Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color:
                      widget.isSelected ? Colors.blue[900] : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomRight: widget.isSelected
                            ? Radius.elliptical(55, 25)
                            : Radius.circular(0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:3),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color:
                      widget.isSelected ? Colors.white : Colors.transparent,
                ),
                width: widthAnimation.value,
                padding: EdgeInsets.only(left: 12, right: 0, top: 10, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      widget.icon,
                      color: widget.isSelected ? Colors.blue[800] : Colors.white,
                      size: 25.0,
                    ),
                    SizedBox(width: sizedBoxAnimation.value),
                    (widthAnimation.value >= 190)
                        ? Text(widget.title,
                            style: widget.isSelected
                                ? listTitleSelectedTextStyle
                                : listTitleDefaultTextStyle)
                        : Container(width: 0,)
                  ],
                ),
              ),
            ),
            Container(
              height: 5,
              child: Stack(
                children: [
                  Container(height: 5,
                      color:widget.isSelected ? Colors.white  : Colors.transparent,),
                  Container(
                    height: 5,
                    decoration: BoxDecoration(
                      color:
                      widget.isSelected ? Colors.blue[900] : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topRight: widget.isSelected
                            ? Radius.elliptical(55, 25)
                            : Radius.circular(0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
