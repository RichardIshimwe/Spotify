import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton(
      {super.key, required this.onPressed, required this.title, this.height});
  final VoidCallback onPressed;
  final String title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height ?? 80)),
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
