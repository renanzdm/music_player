import 'package:mobx/mobx.dart';

part 'genre_controller.g.dart';

class GenreController = _GenreControllerBase with _$GenreController;

abstract class _GenreControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
