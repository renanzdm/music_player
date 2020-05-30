import 'package:mobx/mobx.dart';

part 'card_artist_controller.g.dart';

class CardArtistController = _CardArtistControllerBase
    with _$CardArtistController;

abstract class _CardArtistControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
