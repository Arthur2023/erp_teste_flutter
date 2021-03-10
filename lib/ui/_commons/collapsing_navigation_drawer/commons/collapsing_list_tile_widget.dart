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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            topRight: widget.isBelow ? Radius.circular(15) : Radius.circular(0),
            bottomRight: widget.isAbove ? Radius.circular(15) : Radius.circular(0),
          ),
          color: widget.isSelected ? Colors.grey[300] : Colors.transparent,
        ),
        width: widthAnimation.value,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                : Container()
          ],
        ),
      ),
    );
  }
}
