import 'package:mobx/mobx.dart';

part 'video_tile_controller.g.dart';

class VideoTileController = _VideoTileControllerBase with _$VideoTileController;

abstract class _VideoTileControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  


  
}
