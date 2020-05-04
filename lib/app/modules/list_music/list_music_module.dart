import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/app_module.dart';
import 'package:musicplayer/app/modules/list_music/list_music_controller.dart';
import 'package:musicplayer/app/modules/list_music/list_music_page.dart';
import 'package:musicplayer/app/shared/repositories/video_repository.dart';


class ListMusicModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ListMusicController(AppModule.to.get<VideoRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ListMusicPage()),
      ];

  static Inject get to => Inject<ListMusicModule>.of();
}
