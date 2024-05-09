import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;
  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Text(
        description,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
