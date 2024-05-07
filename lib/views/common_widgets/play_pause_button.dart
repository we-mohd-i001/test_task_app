import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final double? size;
  final void Function()? onPressed;
  final bool isPlaying;
  const PlayPauseButton(
      {super.key, required this.isPlaying, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () {},
      icon: isPlaying
          ? Icon(
              Icons.pause_circle_rounded,
              size: size,
            )
          : Icon(
              Icons.play_circle_rounded,
              size: size,
            ),
    );
  }
}
