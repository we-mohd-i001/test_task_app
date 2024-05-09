import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/task/task_controller.dart';
import 'task_widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.put(TaskController());
    return Obx(
      () => ListView.builder(
          itemCount: taskController.taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskWidget(
                task: taskController.taskList[index],
                index: index,
              ),
            );
          }),
    );
  }
}
