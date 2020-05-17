import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/album/album_controller.dart';
import 'package:musicplayer/app/modules/album/album_page.dart';

import '../../app_module.dart';

class AlbumModule extends WidgetModule {
  @override
  List<Bind> get binds =>
      [Bind((i) => AlbumController(AppModule.to.get<FlutterAudioQuery>()))];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AlbumPage()),
      ];

  static Inject get to => Inject<AlbumModule>.of();

  @override
  Widget get view => AlbumModule();
}
