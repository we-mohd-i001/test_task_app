import 'package:test_task_app/controllers/task/create_task_controller.dart';

import '../../constants/constants.dart';
import '../common_widgets/create_app_bar_widget.dart';
import '../task/task_create_view.dart';
import 'widgets/task_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    TaskController taskController = Get.put(TaskController());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () {
          Navigator.push(context, TaskCreateView.route());
        },
      ),
      appBar: createAppBarWidget(title: homeTitle, implyLeading: false),
      body: const SafeArea(child: TaskList()),
    );
  }
}
