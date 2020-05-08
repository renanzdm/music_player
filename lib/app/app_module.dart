import 'package:musicplayer/app/shared/widgets/album_card/album_card_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/app_controller.dart';
import 'package:musicplayer/app/app_widget.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';
import 'package:musicplayer/app/modules/list_music/list_music_module.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_controller.dart';

import 'shared/widgets/button/buttom_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AlbumCardController()),
        Bind((i) => ButtonController()),
        Bind((i) => AppBarController()),
        Bind((i) => AppController()),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          module: ListMusicModule(),
        ),
        Router(
          '/home',
          module: HomeModule(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
