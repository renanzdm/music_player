import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_controller.dart';

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
    final appBarController = AppBarController();
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
          Expanded(
              child: TabBar(
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12,
                  ),
                  labelStyle: TextStyle(
                    fontSize: 20,
                  ),
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.white,
                  indicatorColor: Colors.transparent,
                  tabs: [
                Tab(
                  text: 'data',
                ),
                Tab(
                  text: 'data',
                ),
                Tab(
                  text: 'data',
                ),
              ])),
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
