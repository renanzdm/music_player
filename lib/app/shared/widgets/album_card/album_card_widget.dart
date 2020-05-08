import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/widgets/album_card/album_card_controller.dart';
import 'package:vector_math/vector_math.dart' as vector;

class AlbumCardWidget extends StatefulWidget {
  final bool itemSelected;

  const AlbumCardWidget({Key key, this.itemSelected}) : super(key: key);

  @override
  _AlbumCardWidgetState createState() => _AlbumCardWidgetState();
}

class _AlbumCardWidgetState
    extends ModularState<AlbumCardWidget, AlbumCardController> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double rectanguleHeigth =
            constraints.maxHeight * (widget.itemSelected ? 0.30 : 0.28);
        double rectanguleWidth = constraints.maxHeight * 0.30;
        double downHeigth = constraints.maxHeight * 0.60;
        double downWidth = constraints.maxWidth;
        double discHeigth =
            constraints.maxHeight * (widget.itemSelected ? 0.25 : 0.22);
        double discWidth = constraints.maxHeight * 0.25;
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Stack(
                alignment: Alignment.center,
                overflow: Overflow.visible,
                children: <Widget>[
                  AnimatedPositioned(
                    duration: controller.duration,
                    left: widget.itemSelected ? 70 : 0,
                    child: AnimatedContainer(
                      duration: controller.duration,
                      height: discHeigth,
                      width: discWidth,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: controller.duration,
                    height: rectanguleHeigth,
                    width: rectanguleWidth,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              duration: controller.duration,
              opacity: widget.itemSelected ? 1 : 0,
              child: AnimatedContainer(
                margin: EdgeInsets.zero,
                duration: controller.duration,
                transform: Matrix4.identity(),
                height: downHeigth,
                width: downWidth,
                decoration: BoxDecoration(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
