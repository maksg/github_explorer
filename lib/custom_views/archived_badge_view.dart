import 'package:flutter/material.dart';

class ArchivedBadgeView extends StatelessWidget {
  const ArchivedBadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orange),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        'Public archive',
        style: TextStyle(
          color: Colors.orange,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
