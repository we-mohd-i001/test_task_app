import '../../../constants/constants.dart';
import '../../../controllers/timer/timer_controller.dart';
import '../../../helpers/helper.dart';
import '../../common_widgets/play_pause_button.dart';
import '../../common_widgets/timer_widget.dart';
import 'description_widget.dart';
import 'task_icon.dart';
import 'task_title.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final TaskType type;
  final String description;
  final int hours;
  final int minutes;
  final int seconds;
  final void Function()? onPressed;
  final int index;

  const TaskWidget({
    super.key,
    required this.title,
    required this.description,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.type,
    this.onPressed,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    TimerController timerController = Get.put(TimerController());
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed ?? () {},
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
            TaskIcon(icon: getIcon(type) ?? Icons.sticky_note_2),
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
                    TaskTitle(title: title),
                    DescriptionWidget(
                      description: description,
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
                        ? '$hours:$minutes:$seconds'
                        : timerController.getTimeDurationString.value)),
                Obx(
                  () => PlayPauseButton(
                      onPressed: () =>
                          timerController.playPauseTimer(index, minutes, hours),
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
