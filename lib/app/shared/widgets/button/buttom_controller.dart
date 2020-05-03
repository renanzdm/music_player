import 'package:mobx/mobx.dart';

part 'buttom_controller.g.dart';

class ButtonController = _ButtonControllerBase with _$ButtonController;

abstract class _ButtonControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
