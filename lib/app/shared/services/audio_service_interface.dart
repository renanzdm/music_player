import 'package:flutter_audio_query/flutter_audio_query.dart';

abstract class IAudioService {
  Future<List<AlbumInfo>> getAlbuns();
  Future<List<ArtistInfo>> getArtists();
  Future<List<SongInfo>> getSongs();
}
