import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/app_module.dart';
import 'package:musicplayer/app/shared/widgets/button_player/button_player_widget.dart';

import '../../../app_controller.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController _appController = AppModule.to.get();

    return Observer(builder: (_) {
      return GestureDetector(
        onTap: _appController.getFaixa != null
            ? () {
                Modular.to.pushNamed('/reproduction/${_appController.getFaixa}',
                    arguments: _appController.songModel.listSongPlayer);
              }
            : null,
        child: ClipPath(
          clipper: ClipBottomAppBar(),
          child: Container(
            color: Theme.of(context).disabledColor,
            height: 100,
            margin: EdgeInsets.all(10),
          ),
        ),
      );
    });
  }
}

class ClipBottomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    var controlPoint = Offset(
        ((size.width / 2) / 2),
        ((size.height / 2) /
            2)); //X = ((size.width/2)/2) e Y = ((size.heigth/2)/2) ponto de controle
    var endPoint =
        Offset(size.width, 0); //pontos da reta x= valor máximo e y = 0
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
