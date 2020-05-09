import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AppBarWidget({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Icon(Icons.search,color: Colors.grey.shade600,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Icon(Icons.more_vert,color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
