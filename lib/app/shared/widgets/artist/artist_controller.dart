import 'package:mobx/mobx.dart';

part 'artist_controller.g.dart';

class ArtistController = _ArtistControllerBase with _$ArtistController;

abstract class _ArtistControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
