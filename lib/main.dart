import 'package:flutter/material.dart';

import 'views/home/home_view.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  );
}
