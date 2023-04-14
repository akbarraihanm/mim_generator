import 'dart:io';

import 'package:flutter/cupertino.dart';

class StretchOverscroll extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return StretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }
}

class StretchOverScrollWidget extends StatelessWidget {

  final Widget child;

  const StretchOverScrollWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: Platform.isAndroid? StretchOverscroll()
          : const CupertinoScrollBehavior(),
      child: child,
    );
  }
}
