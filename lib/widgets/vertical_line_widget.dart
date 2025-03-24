import 'package:flutter/material.dart';

class VerticalLineWidget extends StatelessWidget {
  final double? height;
  const VerticalLineWidget({super.key, this.height = 17});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1,
      color: Colors.grey,
      margin: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
