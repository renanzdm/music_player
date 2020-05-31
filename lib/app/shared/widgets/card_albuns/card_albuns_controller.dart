import 'package:mobx/mobx.dart';

part 'card_albuns_controller.g.dart';

class CardAlbunsController = _CardAlbunsControllerBase
    with _$CardAlbunsController;

abstract class _CardAlbunsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
