import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../helpers/task_type_helper.dart';
import '../../models/task/task.dart';
import 'task_list_controller.dart';

class TaskController extends GetxController {
  RxList<Task> taskList = <Task>[].obs;
  RxInt selectedHours = 0.obs;
  RxInt selectedMinutes = 0.obs;
  RxString selectedTaskType = 'Other'.obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  TaskListController taskListController = Get.find<TaskListController>();

  void createTask() {
    Task task = Task(
      id: '',
      title: titleController.text,
      type: taskType(selectedTaskType.value),
      description: description,
      hours: selectedHours.value,
      minutes: selectedMinutes.value,
      seconds: 0,
    );
    taskListController.addTaskId(taskList.length);
    taskList.add(task);
  }

  void upateTask(Task task, index) {
    taskList[index] = task;
  }

  String get description {
    return descriptionController.text;
  }

  List<DropdownMenuItem<String>>? getDropDownMenuItem() {
    final List<String> dropDownItems = [
      AppStrings.codeRelated,
      AppStrings.uiRelated,
      AppStrings.analysis,
      AppStrings.other,
    ];
    return dropDownItems.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    hourController.clear();
    minutesController.clear();
    selectedTaskType.value = AppStrings.other;
    selectedHours.value = 0;
    selectedMinutes.value = 0;
  }
}
