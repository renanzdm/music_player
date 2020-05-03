import 'package:flutter/material.dart';
import 'package:musicplayer/app/shared/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  final double heigth;
  final double width;
  final IconData icon;
  final Function onTap;
  final Color color;

  static const COLORDEFAULT = Color(0xFF2c3035);
  static const COLORPLAY = Colors.deepOrange;

  const ButtonWidget(
      {Key key,
      this.heigth,
      this.width,
      this.icon,
      this.onTap,
      this.color = COLORDEFAULT})
      : super(key: key);
  const ButtonWidget.color(
      {Key key,
      this.heigth,
      this.width,
      this.icon,
      this.onTap,
      this.color = COLORPLAY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.09),
              offset: Offset(-2, -2),
              blurRadius: 3,
            ),
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 3,
            ),
          ],
        ),
        padding: EdgeInsets.all(4),
        child: Container(
          child: Icon(
            icon,
            color: textColor,
          ),
          height: heigth,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(-2, -2),
                blurRadius: 3,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.09),
                offset: Offset(2, 2),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
