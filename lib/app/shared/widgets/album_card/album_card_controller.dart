import 'package:flutter/animation.dart';
import 'package:mobx/mobx.dart';

part 'album_card_controller.g.dart';

class AlbumCardController = _AlbumCardControllerBase with _$AlbumCardController;

abstract class _AlbumCardControllerBase with Store {
  Duration duration = Duration(milliseconds: 500);

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
