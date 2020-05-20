import 'package:flutter/material.dart';

class ButtonPlayerWidget extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  final double sizeButton;

  const ButtonPlayerWidget({
    Key key,
    this.icon,
    this.onTap,
    this.sizeButton = 50,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: sizeButton,
        width: sizeButton,
        child: Icon(
          icon,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            shape: BoxShape.circle,
            border: Border.all(color: Theme.of(context).accentColor, width: 2)),
      ),
    );
  }
}
