import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/utils/colors.dart';
import 'package:musicplayer/app/shared/widgets/button/buttom_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const AppBarWidget({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext _, BoxConstraints constraints) {
        final itemHeight = constraints.maxHeight * 0.8;
        final itemWidth = constraints.maxWidth * 0.2;
        return Container(
          margin: EdgeInsets.all(10),
          height: height,
          child: Row(
            children: <Widget>[
              ButtonWidget(
                onTap: () {},
                icon: Icons.arrow_back_ios,
                heigth: itemHeight,
                width: itemWidth,
              ),
              Expanded(
                child: Text(
                  'Escutando Agora',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: textColor,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ButtonWidget(
                onTap: () {
                  Modular.to.pushNamed('/listmusic');
                },
                icon: Icons.dehaze,
                heigth: itemHeight,
                width: itemWidth,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
