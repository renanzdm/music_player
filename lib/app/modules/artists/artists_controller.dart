import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/services/audio_service_interface.dart';

part 'artists_controller.g.dart';

class ArtistsController = _ArtistsControllerBase with _$ArtistsController;

abstract class _ArtistsControllerBase with Store {
  final IAudioService iAudioService;

  _ArtistsControllerBase(this.iAudioService) {
    getAlbumData();
  }

  @observable
  List<ArtistInfo> listArtists;
  @action
  getAlbumData() async {
    listArtists = await iAudioService.getArtists();
  }
}
