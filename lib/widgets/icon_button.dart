import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onPressed;
  final IconData? iconData;
  const AppIconButton({super.key, this.title, this.onPressed, this.iconData});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title!, style: TextStyle(color: Colors.white)),
          SizedBox(width: 8),
          Icon(iconData, color: Colors.white),
        ],
      ),
    );
  }
}
