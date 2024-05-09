import 'dart:async';

import 'package:get/get.dart';

import '../../models/task/task.dart';
import '../task/task_controller.dart';

class TimerController extends GetxController {
  TaskController taskController = Get.find<TaskController>();
  RxBool isTimerRunning = false.obs;
  RxInt runningTaskId = (-1).obs;
  RxInt seconds = 0.obs;
  RxInt minutes = 0.obs;
  RxInt hours = 0.obs;
  late Timer timer;

  void playPauseTimer(
    index,
    minutesFrom,
    hoursFrom,
  ) {
    if (runningTaskId.value == -1) {
      runningTaskId(index);
      isTimerRunning(true);
      minutes.value = minutesFrom;
      hours.value = hoursFrom;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (seconds.value == 0) {
          if (minutes.value == 0) {
            if (hours.value == 0) {
              isTimerRunning(false);
              runningTaskId(-1);
              timer.cancel();
              return;
            }
            hours.value--;
            minutes.value = 59;
            seconds.value = 59;
          } else {
            minutes.value--;
            seconds.value = 59;
          }
        }
        seconds--;
        Task newTask = taskController.taskList[runningTaskId.value].copyWith(
            hours: hours.value, minutes: minutes.value, seconds: seconds.value);
        taskController.upateTask(newTask, index);
      });
    } else if (runningTaskId.value != index && isTimerRunning.value) {
      Get.snackbar('Error', 'Another Timer Running!',
          snackPosition: SnackPosition.BOTTOM);
    } else if (runningTaskId == index) {
      isTimerRunning(false);
      runningTaskId(-1);
      timer.cancel();
    }
  }

  RxString get getTimeDurationString {
    RxString timeString =
        '${hours.value}:${minutes.value}:${seconds.value}'.obs;
    return timeString;
  }
}
