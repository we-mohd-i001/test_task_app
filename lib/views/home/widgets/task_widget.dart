import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/timer/timer_controller.dart';
import '../../../helpers/helper.dart';
import '../../../models/task/task.dart';
import '../../common_widgets/play_pause_button.dart';
import '../../common_widgets/timer_widget.dart';
import '../../task/task_view.dart';
import 'description_widget.dart';
import 'task_icon.dart';
import 'task_title.dart';

class TaskWidget extends StatelessWidget {
  final Task task;
  final int index;

  const TaskWidget({
    super.key,
    required this.index,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    TimerController timerController = Get.put(TimerController());
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.push(
          context,
          TaskView.route(
            task: task,
            index: index,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        constraints: const BoxConstraints(
            maxHeight: 100,
            maxWidth: double.infinity,
            minHeight: 100,
            minWidth: 100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TaskIcon(icon: getIcon(task.type) ?? Icons.sticky_note_2),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: 100,
                    minWidth: 80,
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                    minHeight: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TaskTitle(title: task.title),
                    DescriptionWidget(
                      description: task.description,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => TimerWidget(
                    time: (timerController.runningTaskId.value == -1 ||
                            timerController.runningTaskId.value != index)
                        ? '${task.hours}:${task.minutes}:${task.seconds}'
                        : timerController.getTimeDurationString.value)),
                Obx(
                  () => PlayPauseButton(
                      onPressed: () => timerController.playPauseTimer(
                          index, task.minutes, task.hours),
                      isPlaying: timerController.runningTaskId.value == -1
                          ? false
                          : timerController.isTimerRunning.value &&
                              timerController.runningTaskId.value == index),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
