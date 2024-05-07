import 'package:test_task_app/views/common_widgets/play_pause_button.dart';
import 'package:test_task_app/views/common_widgets/timer_widget.dart';

import '../../../constants/constants.dart';
import '../../../helpers/helper.dart';
import 'tags_widget.dart';
import 'task_icon.dart';
import 'task_title.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final List<String>? tags;
  final TaskType type;
  const TaskWidget(
      {super.key, required this.title, this.tags, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TaskIcon(icon: getIcon(type) ?? Icons.sticky_note_2),
          Container(
            constraints: BoxConstraints(
                maxHeight: 100,
                minWidth: 80,
                maxWidth: MediaQuery.of(context).size.width * 0.6,
                minHeight: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TaskTitle(title: title),
                const TagsWidget(
                  tags: ['Computer', 'Science', 'Flutter'],
                ),
              ],
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TimerWidget(),
              PlayPauseButton(isPlaying: true),
            ],
          )
        ],
      ),
    );
  }
}
