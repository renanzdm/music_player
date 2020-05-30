import 'package:mobx/mobx.dart';

part 'artists_controller.g.dart';

class ArtistsController = _ArtistsControllerBase with _$ArtistsController;

abstract class _ArtistsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
