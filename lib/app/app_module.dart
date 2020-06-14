import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/app_widget.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';
import 'package:musicplayer/app/shared/widgets/bottom_app_bar/bottom_app_bar_controller.dart';
import 'modules/albuns/albuns_module.dart';
import 'modules/artists/artists_module.dart';
import 'modules/reproduction/reproduction_module.dart';
import 'modules/songs/songs_module.dart';
import 'shared/services/audio_service_interface.dart';
import 'shared/stores/audio_store.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<IAudioService>((i) => AudioService(i.get())),
        Bind((i) => FlutterAudioQuery()),
        Bind((i) => AudioStore(i.get())),
        Bind((i) => AudioPlayer()),
        Bind((i) => BottomAppBarController(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/albuns', module: AlbunsModule()),
        Router('/artists', module: ArtistsModule()),
        Router('/reproduction', module: ReproductionModule()),
        Router('/songs', module: SongsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
