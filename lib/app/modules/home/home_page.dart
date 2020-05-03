import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/utils/colors.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:musicplayer/app/shared/widgets/button/buttom_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  double changedValue = 0;

  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBarWidget(
        height: 60,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: ButtonWidget(
              width: sizes.width * 0.7,
              heigth: sizes.height * 0.4,
            ),
          ),
          Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: TextStyle(
                      fontSize: 24,
                      color: textColor,
                      fontWeight: FontWeight.bold),
                  text: 'A ele a Glória',
                ),
                TextSpan(
                  style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w300),
                  text: '\n Diante do Trono',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Slider(
            max: 1,
            min: 0,
            activeColor: Colors.deepOrange,
            value: changedValue,
            onChanged: (value) {
              setState(() {
                changedValue = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ButtonWidget(
                  onTap: () {},
                  icon: Icons.fast_rewind,
                  heigth: 60,
                  width: 60,
                ),
                ButtonWidget.color(
                  onTap: () {},
                  icon: Icons.play_arrow,
                  heigth: 60,
                  width: 60,
                ),
                ButtonWidget(
                  onTap: () {},
                  icon: Icons.fast_forward,
                  heigth: 60,
                  width: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
