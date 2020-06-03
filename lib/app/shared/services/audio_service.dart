import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/app/shared/services/audio_service_interface.dart';

class AudioService implements IAudioService {
  final FlutterAudioQuery audioQuery;

  @override
  AudioService(this.audioQuery);
  Future<List<AlbumInfo>> getAlbuns() async {
    return await audioQuery.getAlbums();
  }

  @override
  Future<List<ArtistInfo>> getArtists() async {
    return await audioQuery.getArtists();
  }
}
