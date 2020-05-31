import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      this.onTapLeft,
      })
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
              padding: const EdgeInsets.only(left:4.0),
              child: Icon(
                iconLeft,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
              child: TabBar(
                  unselectedLabelStyle: GoogleFonts.bebasNeue(fontSize: 14),
                  labelStyle:  GoogleFonts.bebasNeue(fontSize: 20),
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.transparent,
                  tabs: [
                Tab(
                  text: 'Albuns',
                ),
                Tab(
                  text: 'Músicas',
                ),
                Tab(
                  text: 'Artistas',
                ),
              ])),
          GestureDetector(
            onTap: onTapRigth,
            child: Padding(
              padding: const EdgeInsets.only(right:4.0),
              child: Icon(
                iconRigth,
                color: Colors.white
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
