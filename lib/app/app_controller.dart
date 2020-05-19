import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  SongInfo songInfoPlayer;
  @observable
  List<SongInfo> listSongInfo;

  @action
  getSongPlayer(Map<String, dynamic> value) {
    songInfoPlayer = value['songPlayer'];
    listSongInfo = value['listSongs'];
  }
}
