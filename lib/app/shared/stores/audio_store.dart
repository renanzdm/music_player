import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/models/song_model.dart';
part 'audio_store.g.dart';

class AudioStore = _AudioStoreBase with _$AudioStore;

abstract class _AudioStoreBase with Store {
  final AudioPlayer _audioPlayer;
  _AudioStoreBase(this._audioPlayer) {
    getPositionToMusic();
    getPlayerState();
    getTotalDuration();
  }

  @observable
  SongModel songModel = SongModel();
  @observable
  Duration timeToMusic = Duration();
  @observable
  AudioPlayerState playerState = AudioPlayerState.STOPPED;
  @observable
  Duration audioDuration = Duration();

  @action
  getSongPlayer(SongModel value) {
    songModel = songModel.copyWith(
        indexFaixa: value.indexFaixa,
        listSongPlayer: value.listSongPlayer,
        playerState: value.playerState);
  }

  @computed
  int get getFaixa => songModel.indexFaixa;

  @action
  getPositionToMusic() {
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      timeToMusic = p;
    });
  }

  @action
  getPlayerState() {
    _audioPlayer.onPlayerStateChanged.listen((AudioPlayerState event) {
      playerState = event;
    });
  }

  @action
  getTotalDuration() {
    _audioPlayer.onDurationChanged.listen((event) {
      audioDuration = event;
    });
  }

  actionSong(String localPath, AudioPlayerState playerState) async {
    switch (playerState) {
      case AudioPlayerState.PLAYING:
        await _audioPlayer.pause();
        break;
      case AudioPlayerState.PAUSED:
        await _audioPlayer.play(localPath, isLocal: true);
        break;
      case AudioPlayerState.STOPPED:
        await _audioPlayer.play(localPath, isLocal: true);
        break;
      case AudioPlayerState.COMPLETED:
        await _audioPlayer.play(localPath, isLocal: true);

        break;
      default:
    }
  }

  playSongSelected(String filePath) async {
    if (playerState == AudioPlayerState.PLAYING) {
      await _audioPlayer.stop();
      await _audioPlayer.play(filePath);
    } else if (playerState == AudioPlayerState.STOPPED ||
        playerState == AudioPlayerState.PAUSED) {
      await _audioPlayer.play(filePath);
    }
  }
}
