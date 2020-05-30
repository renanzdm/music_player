import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AudioRepository extends Disposable {
    final FlutterAudioQuery audioQuery;

  AudioRepository(this.audioQuery);

  Future getAlbuns() async {
    
  }

  @override
  void dispose() {}
}
