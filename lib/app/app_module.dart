import 'package:musicplayer/app/modules/details/details_module.dart';
import 'package:musicplayer/app/shared/widgets/bottom_app_bar/bottom_app_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/app_widget.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_controller.dart';
import 'package:musicplayer/app/shared/widgets/card_types/card_types_controller.dart';
import 'package:musicplayer/app/shared/widgets/playlist/playlist_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => BottomAppBarController()),
        Bind((i) => PlaylistController()),
        Bind((i) => CardTypesController()),
        Bind((i) => AppBarController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/details',module: DetailsModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
