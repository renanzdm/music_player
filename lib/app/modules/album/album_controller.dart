import 'package:mobx/mobx.dart';

part 'album_controller.g.dart';

class AlbumController = _AlbumControllerBase with _$AlbumController;

abstract class _AlbumControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
