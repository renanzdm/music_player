import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/stores/audio_store.dart';

part 'details_artist_controller.g.dart';

class DetailsArtistController = _DetailsArtistControllerBase
    with _$DetailsArtistController;

abstract class _DetailsArtistControllerBase with Store {
  final FlutterAudioQuery audioQuery;
  final AudioStore audioStore;

  _DetailsArtistControllerBase(this.audioQuery, this.audioStore);

  @observable
  List<SongInfo> listSongsFromArtist;

  @action
  Future<List<SongInfo>> getSongs(String artist) async {
    return listSongsFromArtist =
        await audioQuery.getSongsFromArtist(artistId: artist);
  }
}
