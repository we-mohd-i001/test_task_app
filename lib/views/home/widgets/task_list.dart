import '../../../constants/constants.dart';
import '../../../controllers/task/create_task_controller.dart';
import '../../task/task_view.dart';
import 'task_widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController createTaskController = Get.find<TaskController>();
    return Obx(
      () => ListView.builder(
          itemCount: createTaskController.taskList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TaskWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    TaskView.route(
                      title: createTaskController.taskList[index].title,
                      index: index,
                      hours: createTaskController.taskList[index].hours,
                      minutes: createTaskController.taskList[index].minutes,
                      seconds: createTaskController.taskList[index].seconds,
                      description:
                          createTaskController.taskList[index].description,
                    ),
                  );
                },
                title: createTaskController.taskList[index].title,
                description: createTaskController.taskList[index].description,
                type: createTaskController.taskList[index].type,
                index: index,
                hours: createTaskController.taskList[index].hours,
                minutes: createTaskController.taskList[index].minutes,
                seconds: createTaskController.taskList[index].seconds,
              ),
            );
          }),
    );
  }
}
