import 'package:mobx/mobx.dart';

part 'list_music_controller.g.dart';

class ListMusicController = _ListMusicControllerBase with _$ListMusicController;

abstract class _ListMusicControllerBase with Store {
  Duration duration = Duration(milliseconds: 500);
  @observable
  int currentPage = 0;
  @action
  setPage(int value) => currentPage = value;
}
