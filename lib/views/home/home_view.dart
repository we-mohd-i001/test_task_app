import '../../constants/constants.dart';
import '../common_widgets/create_app_bar_widget.dart';
import '../task/task_create_view.dart';
import '../task/task_view.dart';
import 'widgets/task_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () {
          Get.to(() => TaskCreateView());
        },
      ),
      appBar: createAppBarWidget(title: homeTitle, implyLeading: false),
      body: SafeArea(
        child: ListView.builder(
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
            }),
      ),
    );
  }
}
