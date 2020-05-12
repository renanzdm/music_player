import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final IconData iconRigth;
  final IconData iconLeft;
  final Function onTapRigth;
  final Function onTapLeft;

  const AppBarWidget(
      {Key key,
      this.height,
      this.iconRigth,
      this.iconLeft,
      this.onTapRigth,
      this.onTapLeft})
      : super(key: key);
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                iconLeft,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTapRigth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(iconRigth, color: Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
