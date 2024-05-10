import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/task/task_controller.dart';
import '../../../controllers/timer/timer_controller.dart';
import '../../../helpers/task_icon_helper.dart';
import '../../../models/task/task.dart';
import '../../common_widgets/play_pause_button.dart';
import '../../common_widgets/timer_widget.dart';
import '../../task/task_view.dart';
import 'task_description.dart';
import 'task_icon.dart';
import 'task_title.dart';

class TaskWidget extends StatelessWidget {
  final int taskId;

  const TaskWidget({
    super.key,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    TimerController timerController = Get.put(TimerController());
    TaskController taskController = Get.put(TaskController());

    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          TaskView.route(
            task: taskController.taskList[taskId],
            index: taskId,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        constraints: const BoxConstraints(
          maxHeight: 100,
          maxWidth: double.infinity,
          minHeight: 100,
          minWidth: 100,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.blue),
        child: Row(
          children: <Widget>[
            TaskIcon(icon: getIcon(taskController.taskList[taskId].type)),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 100,
                  minWidth: 80,
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                  minHeight: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TaskTitle(title: taskController.taskList[taskId].title),
                    TaskDescription(
                        description:
                            taskController.taskList[taskId].description),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => TimerWidget(
                    time: (timerController.runningTaskId.value == -1 ||
                            timerController.runningTaskId.value != taskId)
                        ? '${taskController.taskList[taskId].hours}:'
                            '${taskController.taskList[taskId].minutes}:'
                            '${taskController.taskList[taskId].seconds}'
                        : timerController.getTimeDurationString.value)),
                Obx(
                  () => PlayPauseButton(
                      onPressed: () => timerController.playPauseTimer(
                          taskId,
                          taskController.taskList[taskId].minutes,
                          taskController.taskList[taskId].hours,
                          taskController.taskList[taskId].seconds),
                      isPlaying: timerController.runningTaskId.value == -1
                          ? false
                          : timerController.isTimerRunning.value &&
                              timerController.runningTaskId.value == taskId),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
