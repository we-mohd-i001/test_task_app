import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  final List<String> tags;
  const TagsWidget({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.pink),
                borderRadius: BorderRadius.circular(12)),
            child: Center(child: Text(tags[index])),
          );
        }),
      ),
    );
  }
}
