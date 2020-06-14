import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/stores/audio_store.dart';

part 'bottom_app_bar_controller.g.dart';

class BottomAppBarController = _BottomAppBarControllerBase
    with _$BottomAppBarController;

abstract class _BottomAppBarControllerBase with Store {
  final AudioStore audioStore;

  _BottomAppBarControllerBase(this.audioStore);
}
