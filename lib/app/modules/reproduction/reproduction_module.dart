import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/reproduction/reproduction_controller.dart';
import 'package:musicplayer/app/modules/reproduction/reproduction_page.dart';

class ReproductionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReproductionController(i.get(), i.get())),
      ];

  @override
  List<Router> get routers => [
        Router('/:indexFaixa',
            child: (_, args) => ReproductionPage(
                  indexFaixa: args.params['indexFaixa'],
                  listSongInfo: args.data,
                ),
            transition: TransitionType.leftToRight),
      ];

  static Inject get to => Inject<ReproductionModule>.of();
}
