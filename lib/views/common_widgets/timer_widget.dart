import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final String time;
  const TimerWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(time),
    );
  }
}
