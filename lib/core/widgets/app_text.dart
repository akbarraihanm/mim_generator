import 'package:flutter/material.dart';

import '../../core/config/app_typography.dart';

class AppText extends StatelessWidget {
  final String? title;
  final TextAlign? align;
  final TextOverflow? overflow;
  final int? maxLine;
  final TextStyle? textStyle;
  final Color? bgColor;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const AppText(
      {Key? key,
        this.title,
        this.align,
        this.overflow,
        this.maxLine,
        this.textStyle,
        this.margin,
        this.padding,
        this.bgColor,
        this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      padding: padding,
      color: bgColor,
      child:
        Text(
          title!,
          style: textStyle ?? AppTypography.bodyMedium(),
          maxLines: maxLine,
          overflow: overflow ?? TextOverflow.fade,
          textAlign: align,
        )
    );
  }
}
