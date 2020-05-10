import 'package:musicplayer/app/modules/details/details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/details/details_page.dart';

class DetailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetailsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => DetailsPage(
                  tagHero: args.data,
                ),
            transition: TransitionType.downToUp),
      ];

  static Inject get to => Inject<DetailsModule>.of();
}
