import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final IconData iconRigth;
  final IconData iconLeft;
  final Function onTapRigth;
  final Function onTapLeft;
  final String title;

  const AppBarWidget(
      {Key key,
      this.height,
      this.iconRigth,
      this.iconLeft,
      this.onTapRigth,
      this.onTapLeft,
      this.title = ''})
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Icon(
                iconLeft,
                color: Theme.of(context).textSelectionColor,
              ),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: Theme.of(context).textSelectionColor,
            ),
          ),
          GestureDetector(
            onTap: onTapRigth,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Icon(
                iconRigth,
                color: Theme.of(context).textSelectionColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
