import 'package:mobx/mobx.dart';

part 'songs_controller.g.dart';

class SongsController = _SongsControllerBase with _$SongsController;

abstract class _SongsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
