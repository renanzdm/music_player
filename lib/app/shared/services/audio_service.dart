import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AudioService extends Disposable {
  final FlutterAudioQuery audioQuery;

  AudioService(this.audioQuery);

  Future<List<AlbumInfo>> getAlbuns() async {
    return await audioQuery.getAlbums();
  }

  Future<List<ArtistInfo>> getArtists() async {
    return await audioQuery.getArtists();
  }

  @override
  void dispose() {}
}
