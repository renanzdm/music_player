import 'package:mobx/mobx.dart';

part 'albuns_controller.g.dart';

class AlbunsController = _AlbunsControllerBase with _$AlbunsController;

abstract class _AlbunsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
