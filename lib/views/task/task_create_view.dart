import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/task/task_controller.dart';
import '../common_widgets/create_app_bar_widget.dart';
import 'widgets/duration_selector.dart';

class TaskCreateView extends StatelessWidget {
  const TaskCreateView({super.key});

  static Route<void> route() {
    _initialize();
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/create'),
      builder: (_) => const TaskCreateView(),
    );
  }

  static _initialize() {
    return Get.isRegistered<TaskController>()
        ? Get.find<TaskController>()
        : Get.put(TaskController());
  }

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find<TaskController>();
    taskController.clearFields();
    return Scaffold(
      appBar: createAppBarWidget(
        title: AppStrings.createANewTask,
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: taskController.titleController,
              decoration: const InputDecoration(labelText: AppStrings.title),
            ),
            Margins.verticalMargin16,
            TextField(
              controller: taskController.descriptionController,
              decoration:
                  const InputDecoration(labelText: AppStrings.description),
            ),
            Margins.verticalMargin16,
            const DurationSelector(),
            DropdownButtonFormField(
              value: taskController.selectedTaskType.value,
              items: taskController.getDropDownMenuItem(),
              onChanged: (newValue) {
                taskController.selectedTaskType(newValue);
              },
              decoration: const InputDecoration(labelText: AppStrings.taskType),
            ),
            Margins.verticalMargin16,
            ElevatedButton(
              onPressed: () {
                taskController.createTask();
                Navigator.pop(context);
              },
              child: const Text(AppStrings.createTask),
            ),
          ],
        ),
      ),
    );
  }
}
