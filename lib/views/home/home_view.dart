import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../common_widgets/create_app_bar_widget.dart';
import '../task/task_create_view.dart';
import 'widgets/task_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () {
          Navigator.push(context, TaskCreateView.route());
        },
      ),
      appBar: createAppBarWidget(title: homeTitle, implyLeading: false),
      body: const SafeArea(child: TaskListView()),
    );
  }
}
