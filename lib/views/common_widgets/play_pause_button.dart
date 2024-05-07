import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool isPlaying;
  const PlayPauseButton({super.key, required this.isPlaying, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () {},
      icon: isPlaying
          ? const Icon(Icons.pause_circle_rounded)
          : const Icon(Icons.play_circle_rounded),
    );
  }
}
