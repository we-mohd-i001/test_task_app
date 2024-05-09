import '../../../constants/constants.dart';
import '../../../controllers/task/create_task_controller.dart';
import '../../task/task_view.dart';
import 'task_widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.put(TaskController());
    return Obx(
      () => ListView.builder(
          itemCount: taskController.taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    TaskView.route(
                      title: taskController.taskList[index].title,
                      index: index,
                      hours: taskController.taskList[index].hours,
                      minutes: taskController.taskList[index].minutes,
                      seconds: taskController.taskList[index].seconds,
                      description: taskController.taskList[index].description,
                    ),
                  );
                },
                title: taskController.taskList[index].title,
                description: taskController.taskList[index].description,
                type: taskController.taskList[index].type,
                index: index,
                hours: taskController.taskList[index].hours,
                minutes: taskController.taskList[index].minutes,
                seconds: taskController.taskList[index].seconds,
              ),
            );
          }),
    );
  }
}
