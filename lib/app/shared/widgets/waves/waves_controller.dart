import 'package:mobx/mobx.dart';

part 'waves_controller.g.dart';

class WavesController = _WavesControllerBase with _$WavesController;

abstract class _WavesControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
