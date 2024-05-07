import 'package:flutter/material.dart';

class TaskIcon extends StatelessWidget {
  final IconData icon;
  const TaskIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 36,
    );
  }
}
