import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mim_generator/core/config/app_color.dart';
import 'package:mim_generator/core/config/app_typography.dart';
import 'package:mim_generator/core/widgets/app_text.dart';

class DraggableText extends StatelessWidget {
  final String text;
  final Function(double a, double b) drag;

  const DraggableText({
    Key? key,
    required this.text,
    required this.drag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 100,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Draggable(
          feedback: AppText(
            title: text,
            textStyle: AppTypography.titleMedium(color: AppColor.biruGelap),
          ),
          childWhenDragging: Container(color: Colors.transparent),
          child: AppText(
            title: text,
            textStyle: AppTypography.titleMedium(color: AppColor.biruGelap),
          ),
          onDragEnd: (details) => drag.call(
            details.offset.dx,
            details.offset.dy - kToolbarHeight - MediaQueryData.fromWindow(window).padding.top,
          ),
        ),
      ),
    );
  }
}
