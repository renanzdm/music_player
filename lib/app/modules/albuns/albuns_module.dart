import 'package:flutter/material.dart';
import 'package:musicplayer/app/app_module.dart';
import 'package:musicplayer/app/modules/albuns/albuns_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/albuns/albuns_page.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';

class AlbunsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AlbunsController(AppModule.to.get<AudioService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AlbunsPage()),
      ];

  static Inject get to => Inject<AlbunsModule>.of();

  @override
  Widget get view => AlbunsPage();
}
