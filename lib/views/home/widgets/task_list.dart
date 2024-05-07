import '../../../constants/constants.dart';
import '../../task/task_view.dart';
import 'task_widget.dart';

class TaskList extends StatelessWidget {
  final List taskList;
  const TaskList({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TaskWidget(
              onPressed: () {
                Get.to(() => const TaskView(title: 'Coding'),
                    transition: Transition.rightToLeftWithFade);
              },
              title: 'No title',
              type: TaskType.codeRelated,
            ),
          );
        });
  }
}
