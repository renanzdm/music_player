import 'package:mobx/mobx.dart';

part 'button_player_controller.g.dart';

class ButtonPlayerController = _ButtonPlayerControllerBase
    with _$ButtonPlayerController;

abstract class _ButtonPlayerControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
