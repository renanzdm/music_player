import 'package:flutter/material.dart';
import 'package:musicplayer/app/app_module.dart';
import 'package:musicplayer/app/modules/albuns/albuns_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/albuns/albuns_page.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';

import 'pages/details_album/details_album_controller.dart';
import 'pages/details_album/details_album_page.dart';

class AlbunsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AlbunsController(AppModule.to.get<AudioService>())),
        Bind((i) => DetailsAlbumController(i.get(), i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => AlbunsPage()),
    ModularRouter('/detailsAlbum',
            child: (_, args) => DetailsAlbumPage(
                  albumInfo: args.data,
                ),
            transition: TransitionType.leftToRight),
      ];

  static Inject get to => Inject<AlbunsModule>.of();

  @override
  Widget get view => AlbunsPage();
}
