import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:musicplayer/app/modules/song/song_controller.dart';
import 'package:musicplayer/app/modules/song/song_module.dart';

void main() {
  initModule(SongModule());
  // SongController song;
  //
  setUp(() {
    //     song = SongModule.to.get<SongController>();
  });

  group('SongController Test', () {
    //   test("First Test", () {
    //     expect(song, isInstanceOf<SongController>());
    //   });

    //   test("Set Value", () {
    //     expect(song.value, equals(0));
    //     song.increment();
    //     expect(song.value, equals(1));
    //   });
  });
}
