import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mim_generator/core/config/app_color.dart';

class AppLoading extends StatelessWidget {
  final EdgeInsets? margin;

  const AppLoading({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        child: SizedBox(
          height: 32,
          width: 32,
          child: Platform.isAndroid?
          CircularProgressIndicator(color: AppColor.biruGelap):
          CupertinoActivityIndicator(radius: 16, color: AppColor.biruGelap),
        ),
      ),
    );
  }
}
