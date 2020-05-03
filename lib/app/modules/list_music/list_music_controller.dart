import 'package:mobx/mobx.dart';

part 'list_music_controller.g.dart';

class ListMusicController = _ListMusicsControllerBase
    with _$ListMusicController;

abstract class _ListMusicsControllerBase with Store {
  _ListMusicsControllerBase() {
    print('teste');
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
