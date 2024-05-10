import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../controllers/task/task_controller.dart';

class DurationSelector extends StatelessWidget {
  const DurationSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find<TaskController>();
    return Column(
      children: [
        Obx(
          () => Row(
            children: <Widget>[
              Text(
                  '${AppStrings.duration}: ${taskController.selectedHours} ${AppStrings.hours}'
                  ' ${taskController.selectedMinutes} ${AppStrings.minutes}'),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: 120.0,
              child: TextField(
                maxLength: 2,
                controller: taskController.hourController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  taskController.selectedHours.value = int.tryParse(value) ?? 0;
                },
                decoration: const InputDecoration(labelText: AppStrings.hours),
              ),
            ),
            SizedBox(
              width: 120.0,
              child: TextField(
                maxLength: 2,
                controller: taskController.minutesController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  taskController.selectedMinutes.value =
                      int.tryParse(value) ?? 0;
                },
                decoration:
                    const InputDecoration(labelText: AppStrings.minutes),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
