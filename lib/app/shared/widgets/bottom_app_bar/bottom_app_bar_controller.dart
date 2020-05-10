import 'package:mobx/mobx.dart';

part 'bottom_app_bar_controller.g.dart';

class BottomAppBarController = _BottomAppBarControllerBase
    with _$BottomAppBarController;

abstract class _BottomAppBarControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
