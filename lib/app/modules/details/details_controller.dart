import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  final FlutterAudioQuery _audioQuery;

  _DetailsControllerBase(this._audioQuery);

  @observable
  List<SongInfo> songs;

  @action
  getSongs(String albumId) async {
    songs = await _audioQuery.getSongsFromAlbum(albumId: albumId);
    songs.forEach((element) {
      print(element.title);
    });
  }
}
