import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

import '../../utils/colors.dart';

class VideoTileWidget extends StatelessWidget {
  final String title;
  final String channel;
  final String imgUrl;
  final String videoId;

  const VideoTileWidget(
      {Key key, this.title, this.imgUrl, this.channel, this.videoId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FlutterYoutube.playYoutubeVideoById(apiKey: APIKEY, videoId: videoId);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: title, style: TextStyle(fontSize: 16)),
                      TextSpan(
                        text: '\n$channel',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
