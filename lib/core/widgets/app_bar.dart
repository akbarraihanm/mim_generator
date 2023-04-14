import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/app_color.dart';
import '../config/app_typography.dart';
import 'app_text.dart';

class CustomAppBar {
  static PreferredSizeWidget titled({
    Color? color,
    Color? titleColor,
    String? title,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AppBar(
      title: AppText(
        title: title,
        textStyle: AppTypography.headLine(color: titleColor ?? Colors.black),
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: color ?? Colors.blue,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
    );
  }

  static PreferredSizeWidget backBtn({
    Color? color,
    String? title,
    Color? btnColor,
    Color? titleColor,
    double? elevation,
    Function()? onBackPressed}) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AppBar(
      title: AppText(
        title: title,
        textStyle: AppTypography.titleMedium(color: btnColor ?? Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: color ?? Colors.blue,
      elevation: elevation ?? 0.0,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      leading: BackButton(
        onPressed: onBackPressed,
        color: btnColor ?? Colors.white,
      ),
    );
  }

  static PreferredSizeWidget backBtnNoTitle({
    Color? color,
    Color? btnColor,
    double? height,
    double? elevation,
    Function()? onBackPressed,
    List<Widget>? actions,
  }) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return AppBar(
      backgroundColor: color ?? Colors.transparent,
      elevation: elevation ?? 0.0,
      toolbarHeight: height,
      iconTheme: const IconThemeData(color: Colors.white),
      automaticallyImplyLeading: true,
      leading: BackButton(
        onPressed: onBackPressed,
        color: btnColor ?? Colors.white,
      ),
      actions: actions ?? [],
    );
  }

  static PreferredSizeWidget filter(BuildContext context) {
    return AppBar(
      leading: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.close,
          size: 24,
          color: Colors.black,
        ),
      ),
      actions: [
        Center(
          child: AppText(
            title: "Filter",
            textStyle: AppTypography.titleMedium(color: AppColor.biruGelap),
            margin: const EdgeInsets.only(right: 24),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 4.5,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}