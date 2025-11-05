import 'package:flutter/material.dart';
import 'package:footybin/common/design_system/colors.dart';

class FormBadge extends StatelessWidget {
  final String result;

  const FormBadge({super.key, required this.result});

  Color _getColor(String result) {
    switch (result.toUpperCase()) {
      case 'W':
        return Colors.green; // win
      case 'D':
        return Colors.orange; // draw
      case 'L':
        return Colors.red; // loss
      default:
        return Colors.grey; // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: _getColor(result),
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Text(
        result.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
