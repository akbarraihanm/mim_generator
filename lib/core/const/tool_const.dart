import 'package:flutter/material.dart';

class Tools {
  static double mediaHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double mediaWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}