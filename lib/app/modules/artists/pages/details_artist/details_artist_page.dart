import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/shared/widgets/details_card/details_card_widget.dart';
import 'details_artist_controller.dart';

class DetailsArtistPage extends StatefulWidget {
  final String title;
  final ArtistInfo artistInfo;

  const DetailsArtistPage(
      {Key key, this.title = "DetailsArtist", this.artistInfo})
      : super(key: key);

  @override
  _DetailsArtistPageState createState() => _DetailsArtistPageState();
}

class _DetailsArtistPageState
    extends ModularState<DetailsArtistPage, DetailsArtistController> {
  @override
  void initState() {
    super.initState();
    controller.getSongs(widget.artistInfo.name);
  }
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        List<SongInfo> list = controller.listSongsFromArtist;
        if (list != null) {
          return Material(
            color: Theme.of(context).primaryColor,
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: MySliverAppBar(
                      expandedHeight: 200, artistInfo: widget.artistInfo),
                  pinned: true,
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 100),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return DetailsCardWidget(
                        songInfo: list[index],
                        onTap: () async {
                          await controller.audioStore.playSongSelected(
                            list[index].filePath,
                          );

                          Modular.to.pushNamed('/reproduction/$index',
                              arguments: list);
                        },
                      );
                    }, childCount: list.length),
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final ArtistInfo artistInfo;

  MySliverAppBar({this.artistInfo, @required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        ClipRect(
          child: Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.white.withOpacity(0),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.orange,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: (artistInfo.artistArtPath != null)
                    ? FileImage(File(artistInfo.artistArtPath))
                    : AssetImage(
                        'assets/note.png',
                      ),
              ),
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              artistInfo.name,
              style: GoogleFonts.bebasNeue(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          right: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - (shrinkOffset / expandedHeight)),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (artistInfo.artistArtPath != null)
                      ? FileImage(File(artistInfo.artistArtPath))
                      : AssetImage(
                          'assets/note.png',
                        ),
                ),
              ),
              height: expandedHeight - 20,
              width: expandedHeight,
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Modular.to.pop();
              }),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
