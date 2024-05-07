import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/home/home_view.dart';

void main() {
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  );
}
