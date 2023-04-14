import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

class DraggableImage extends StatelessWidget {
  final File file;
  final Function(double x, double y) drag;

  const DraggableImage({
    Key? key,
    required this.file,
    required this.drag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: Image.file(
        file,
        height: 72,
        width: 72,
        fit: BoxFit.contain,
      ),
      childWhenDragging: Container(),
      child: Image.file(
        file,
        height: 72,
        width: 72,
        fit: BoxFit.contain,
      ),
      onDragEnd: (details) => drag.call(
        details.offset.dx,
        details.offset.dy - kToolbarHeight - MediaQueryData.fromWindow(window).padding.top,
      ),
    );
  }
}
