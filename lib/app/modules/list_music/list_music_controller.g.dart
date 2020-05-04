// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_music_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListMusicController on _ListMusicsControllerBase, Store {
  final _$videosAtom = Atom(name: '_ListMusicsControllerBase.videos');

  @override
  List<VideoModel> get videos {
    _$videosAtom.context.enforceReadPolicy(_$videosAtom);
    _$videosAtom.reportObserved();
    return super.videos;
  }

  @override
  set videos(List<VideoModel> value) {
    _$videosAtom.context.conditionallyRunInAction(() {
      super.videos = value;
      _$videosAtom.reportChanged();
    }, _$videosAtom, name: '${_$videosAtom.name}_set');
  }

  final _$getVideoAsyncAction = AsyncAction('getVideo');

  @override
  Future getVideo() {
    return _$getVideoAsyncAction.run(() => super.getVideo());
  }

  @override
  String toString() {
    final string = 'videos: ${videos.toString()}';
    return '{$string}';
  }
}
