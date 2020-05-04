import 'package:musicplayer/app/shared/widgets/video_tile/video_tile_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/app_controller.dart';
import 'package:musicplayer/app/app_widget.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';
import 'package:musicplayer/app/modules/list_music/list_music_module.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_controller.dart';
import 'shared/repositories/video_repository.dart';
import 'shared/widgets/button/buttom_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => VideoTileController()),
        Bind((i) => VideoRepository(i.get())),
        Bind((i) => ButtonController()),
        Bind((i) => AppBarController()),
        Bind((i) => AppController()),
        Bind((i) => Dio()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          module: HomeModule(),
        ),
        Router('/listMusic', module: ListMusicModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
