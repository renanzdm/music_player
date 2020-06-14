import 'package:flutter/material.dart';
import 'package:musicplayer/app/modules/artists/artists_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/artists/artists_page.dart';
import 'package:musicplayer/app/modules/artists/pages/details_artist/details_artist_controller.dart';

import 'pages/details_artist/details_artist_page.dart';

class ArtistsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ArtistsController(i.get())),
        Bind(
          (i) => DetailsArtistController(i.get(), i.get()),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ArtistsPage()),
        Router('/detailsArtist',
            child: (_, args) => DetailsArtistPage(
                  artistInfo: args.data,
                )),
      ];

  static Inject get to => Inject<ArtistsModule>.of();

  @override
  Widget get view => ArtistsPage();
}
