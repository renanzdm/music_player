import 'package:musicplayer/app/shared/widgets/card_albuns/card_albuns_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_controller.dart';
import 'package:musicplayer/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/app/app_widget.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CardAlbunsController()),
        Bind((i) => AudioService(i.get())),
        Bind((i) => AppBarController()),
        Bind((i) => AppController(i.get())),
        Bind((i) => FlutterAudioQuery()),
        Bind((i) => AudioPlayer()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
