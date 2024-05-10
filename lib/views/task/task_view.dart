import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/timer/timer_controller.dart';
import '../../models/task/task.dart';
import '../common_widgets/create_app_bar_widget.dart';
import '../common_widgets/play_pause_button.dart';
import '../common_widgets/timer_widget.dart';

class TaskView extends StatelessWidget {
  final Task task;
  final int index;

  const TaskView({
    super.key,
    required this.index,
    required this.task,
  });

  static Route<void> route({
    required Task task,
    required int index,
  }) {
    _initialize();

    return MaterialPageRoute(
      settings: const RouteSettings(name: '/task'),
      builder: (_) => TaskView(
        task: task,
        index: index,
      ),
    );
  }

  static _initialize() {
    return Get.isRegistered<TimerController>()
        ? Get.find<TimerController>()
        : Get.put(TimerController());
  }

  @override
  Widget build(BuildContext context) {
    TimerController timerController = Get.find<TimerController>();
    return Scaffold(
      appBar: createAppBarWidget(
          title: task.title, onPressed: () => Navigator.pop(context)),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(task.description),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  maxHeight: 100,
                  minHeight: 100,
                  minWidth: 100,
                  maxWidth: 260,
                ),
                child: Obx(
                  () => TimerWidget(
                      fontSize: 56,
                      time: (timerController.runningTaskId.value == -1 ||
                              timerController.runningTaskId.value != index)
                          ? AppStrings.paused
                          : timerController.getTimeDurationString.value),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.1),
                constraints: const BoxConstraints(
                  maxHeight: 60,
                  minHeight: 40,
                  minWidth: 60,
                  maxWidth: 200,
                ),
                child: Obx(
                  () => PlayPauseButton(
                    onPressed: () => timerController.playPauseTimer(
                      index,
                      task.minutes,
                      task.hours,
                      task.seconds,
                    ),
                    size: 40,
                    isPlaying: timerController.runningTaskId.value == -1
                        ? false
                        : timerController.isTimerRunning.value &&
                            timerController.runningTaskId.value == index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
