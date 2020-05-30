import 'package:mobx/mobx.dart';

part 'app_bar_controller.g.dart';

class AppBarController = _AppBarControllerBase with _$AppBarController;

abstract class _AppBarControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  getPage(int page) {
    currentIndex = page;
  }
}
