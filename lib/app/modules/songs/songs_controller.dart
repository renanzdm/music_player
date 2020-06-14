import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/services/audio_service_interface.dart';
import 'package:musicplayer/app/shared/stores/audio_store.dart';

part 'songs_controller.g.dart';

class SongsController = _SongsControllerBase with _$SongsController;

abstract class _SongsControllerBase with Store {
  final IAudioService iAudioService;
  final AudioStore audioStore;

  _SongsControllerBase(this.iAudioService, this.audioStore) {
    getDataSongs();
  }

  @observable
  List<SongInfo> listSongs;
  @action
  getDataSongs() async {
    listSongs = await iAudioService.getSongs();
  }
}
