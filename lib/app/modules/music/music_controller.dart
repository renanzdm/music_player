import 'package:mobx/mobx.dart';

part 'music_controller.g.dart';

class MusicController = _MusicControllerBase with _$MusicController;

abstract class _MusicControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
