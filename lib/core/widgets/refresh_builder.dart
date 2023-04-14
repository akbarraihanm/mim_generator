import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshBuilder extends StatelessWidget {

  final Function refresh;
  final ScrollController? controller;
  final Widget child;

  const RefreshBuilder({
    Key? key,
    required this.refresh,
    this.controller,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return RefreshIndicator(
        onRefresh: () async => refresh.call(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: controller,
          child: child,
        ),
      );
    }
    return CustomScrollView(
      controller: controller,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: () async => refresh(),
        ),
        SliverList(delegate: SliverChildListDelegate([Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [child],
        )]))
      ],
    );
  }
}
