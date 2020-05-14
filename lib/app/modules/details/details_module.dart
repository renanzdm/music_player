import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/details/details_controller.dart';
import 'package:musicplayer/app/modules/details/details_page.dart';

import '../../app_module.dart';

class DetailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => DetailsController(
            AppModule.to.get<FlutterAudioQuery>(),
            AppModule.to.get<AudioPlayer>(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => DetailsPage(
                  albumInfo: args.data,
                ),
            transition: TransitionType.leftToRight),
      ];

  static Inject get to => Inject<DetailsModule>.of();
}
