import 'package:mobx/mobx.dart';

part 'waves_controller.g.dart';

class WavesController = _WavesControllerBase with _$WavesController;

abstract class _WavesControllerBase with Store {
  changeWave() {}
}
