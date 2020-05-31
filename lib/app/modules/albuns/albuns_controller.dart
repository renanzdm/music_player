import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';

part 'albuns_controller.g.dart';

class AlbunsController = _AlbunsControllerBase with _$AlbunsController;

abstract class _AlbunsControllerBase with Store {
final AudioService audioService;

  _AlbunsControllerBase(this.audioService){
    getAlbumData();
  }

  @observable
  List<AlbumInfo> listAlbuns;
  @action
  getAlbumData()async{
    listAlbuns = await audioService.getAlbuns();
  }

}
