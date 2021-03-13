import 'dart:math';

import 'package:flutter/material.dart';

class FlippableWidget extends StatefulWidget {
  const FlippableWidget(
      {Key key,
      @required this.frontCardWidget,
      @required this.backCardWidget,
      this.isFront = true})
      : super(key: key);

  final Widget frontCardWidget;
  final Widget backCardWidget;
  final bool isFront;

  @override
  _FlippableWidgetState createState() => _FlippableWidgetState();
}

class _FlippableWidgetState extends State<FlippableWidget> {
  bool isFront;
  double verticalDrag = 0;

  @override
  void initState() {
    isFront = widget.isFront;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (dragDetails) {
        setState(() {
          verticalDrag += dragDetails.delta.dy;
          verticalDrag %= 360;

          if (verticalDrag <= 90 || verticalDrag >= 270) {
            isFront = true;
          } else {
            isFront = false;
          }
        });
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(verticalDrag * pi / 180),
        child: isFront
            ? widget.frontCardWidget
            : Transform(
                transform: Matrix4.identity()..rotateX(pi),
                alignment: Alignment.center,
                child: widget.backCardWidget,
              ),
      ),
    );
  }
}
