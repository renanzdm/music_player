import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';

part 'artist_controller.g.dart';

class ArtistController = _ArtistControllerBase with _$ArtistController;

abstract class _ArtistControllerBase with Store {
  final AudioService audioService;

  _ArtistControllerBase(this.audioService) {
    getArtistData();
  }
  @observable
  List<ArtistInfo> listArtists;

  @action
  getArtistData() async {
    listArtists = await audioService.getArtists();
  }
}
