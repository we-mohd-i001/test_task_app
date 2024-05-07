import '../../constants/constants.dart';
import '../../controllers/task/task_controller.dart';
import '../common_widgets/create_app_bar_widget.dart';
import 'widgets/duration_selector.dart';

class TaskCreateView extends StatelessWidget {
  const TaskCreateView({super.key});

  static Route<void> route() {
    _initialize();
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/create'),
      builder: (_) => const TaskCreateView(),
    );
  }

  static _initialize() {
    return Get.isRegistered<TaskController>()
        ? Get.find<TaskController>()
        : Get.put(TaskController());
  }

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.find<TaskController>();
    return Scaffold(
      appBar: createAppBarWidget(
          title: 'Create a new Task', onPressed: () => Get.back()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: taskController.titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 16.0),
            const DurationSelector(),
            const SizedBox(height: 16.0),
            DropdownButtonFormField(
              value: taskController.selectedTaskType,
              items: taskController.getDropDownmenuItem(),
              onChanged: (newValue) {
                taskController.selectedTaskType = newValue;
              },
              decoration: const InputDecoration(labelText: 'Task Type'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: taskController.tagController,
              onSubmitted: (value) {
                taskController.tags.add(value);
                taskController.tagController.clear();
              },
              decoration: const InputDecoration(labelText: 'Add Tag'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Wrap(
                spacing: 8.0,
                children: taskController.tags.map((tag) {
                  return Chip(
                    label: Text(tag),
                    onDeleted: () {
                      taskController.tags.remove(tag);
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}
