import 'package:flutter/material.dart';

class HorizontalLineWidget extends StatelessWidget {
  final Color? color;
  const HorizontalLineWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 20,
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
