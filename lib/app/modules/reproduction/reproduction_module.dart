import 'package:audioplayers/audioplayers.dart';
import 'package:musicplayer/app/app_module.dart';
import 'package:musicplayer/app/modules/reproduction/reproduction_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/reproduction/reproduction_page.dart';

class ReproductionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReproductionController(AppModule.to.get<AudioPlayer>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ReproductionPage(
                  songInfo: args.data,
                ),
            transition: TransitionType.leftToRight),
      ];

  static Inject get to => Inject<ReproductionModule>.of();
}
