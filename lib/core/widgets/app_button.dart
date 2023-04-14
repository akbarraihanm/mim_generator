import 'package:flutter/material.dart';
import 'package:mim_generator/core/config/app_color.dart';

import '../config/app_typography.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final Function? onPressed;
  final double? height;
  final double? width;
  final Color? color;
  final Widget? child;
  final bool isEnable;
  final double? radius;
  final String? title;
  final double? elevation;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const AppButton(
      {Key? key,
        this.onPressed,
        this.height,
        this.width,
        this.color,
        this.child,
        this.isEnable = true,
        this.radius = 6,
        this.title,
        this.elevation,
        this.textStyle,
        this.padding,
        this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: MaterialButton(
        onPressed: () {
          if (isEnable) onPressed?.call();
        },
        height: height ?? 42,
        minWidth: width ?? double.infinity,
        color: isEnable ? color ?? AppColor.biruGelap : Colors.grey,
        elevation: elevation ?? 2.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
        child: title != null ? AppText(
          title: title,
          textStyle: textStyle ?? AppTypography.action(
            color: isEnable? Colors.white: Colors.white,
          ),
          align: TextAlign.center,
        ) : child,
      ),
    );
  }
}