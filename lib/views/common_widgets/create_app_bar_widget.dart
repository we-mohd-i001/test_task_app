import 'package:flutter/material.dart';

import '../../constants/constants.dart';

PreferredSizeWidget? createAppBarWidget({
  bool implyLeading = true,
  required String title,
  void Function()? onPressed,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: implyLeading,
    leading: implyLeading
        ? IconButton(
            tooltip: AppStrings.back,
            icon: const Icon(Icons.arrow_back),
            onPressed: onPressed,
          )
        : null,
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: actions,
  );
}
