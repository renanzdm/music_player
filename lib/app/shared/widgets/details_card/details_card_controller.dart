import 'package:mobx/mobx.dart';

part 'details_card_controller.g.dart';

class DetailsCardController = _DetailsCardControllerBase
    with _$DetailsCardController;

abstract class _DetailsCardControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
