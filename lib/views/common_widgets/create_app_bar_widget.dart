import 'package:flutter/material.dart';

import '../../constants/constants.dart';

PreferredSizeWidget? createAppBarWidget(
    {bool? implyLeading,
    void Function()? onPressed,
    required String title,
    List<Widget>? actions}) {
  return AppBar(
    automaticallyImplyLeading: implyLeading ?? true,
    leading: implyLeading ?? true
        ? IconButton(
            tooltip: back,
            icon: const Icon(Icons.arrow_back),
            onPressed: onPressed ?? () {},
          )
        : null,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: actions ?? [],
  );
}
