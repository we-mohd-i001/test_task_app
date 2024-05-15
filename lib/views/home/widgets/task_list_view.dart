import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/task/task_list_controller.dart';
import 'task_widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: TaskListController(),
        builder: (value) {
          return ListView.builder(
              itemCount: value.taskIds.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TaskWidget(
                    taskId: value.taskIds[index],
                  ),
                );
              });
        });
  }
}
