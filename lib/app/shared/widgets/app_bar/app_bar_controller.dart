import 'package:mobx/mobx.dart';

part 'app_bar_controller.g.dart';

class AppBarController = _AppBarControllerBase with _$AppBarController;

abstract class _AppBarControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
