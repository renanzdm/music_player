import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBarWidget(
            iconLeft: Icons.search,
            iconRigth: Icons.more_vert,
            height: 50,
            title: 'ASAS',
          ),
          body: Container(
            child: TabBarView(children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.red.shade200,
              ),
              Container(
                color: Colors.red.shade100,
              ),
            ]),
          )),
    );
  }
}
