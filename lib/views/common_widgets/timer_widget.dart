import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final double? fontSize;
  final String time;
  const TimerWidget({super.key, required this.time, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
