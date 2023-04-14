import 'package:flutter/material.dart';

class FilterIndicator extends StatelessWidget {
  final EdgeInsets? margin;

  const FilterIndicator({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 30,
      margin: margin,
      decoration: BoxDecoration(
        color: const Color(0xffc4c4c4),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
