import '../../constants/constants.dart';
import '../common_widgets/create_app_bar_widget.dart';

class TaskCreateView extends StatelessWidget {
  const TaskCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBarWidget(
        title: 'Create a new Task',
        onPressed: () => Get.back(),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [TextFormField()],
            ),
          ),
        ),
      ),
    );
  }
}
