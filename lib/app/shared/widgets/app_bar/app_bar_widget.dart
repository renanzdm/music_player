import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final IconData iconRigth;
  final IconData iconLeft;
  final Function onTapRigth;
  final Function onTapLeft;
  final Widget tabBar;

  const AppBarWidget({
    Key key,
    this.height,
    this.iconRigth,
    this.iconLeft,
    this.onTapRigth,
    this.onTapLeft,
    this.tabBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTapLeft,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                iconLeft,
                color: Colors.white,
              ),
            ),
          ),
          tabBar,
          GestureDetector(
            onTap: onTapRigth,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(iconRigth, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
