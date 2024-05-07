import 'package:test_task_app/views/home/widgets/task_widget.dart';

import '../../constants/constants.dart';
import '../common_widgets/create_app_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () {},
      ),
      appBar: createAppBarWidget(title: homeTitle, implyLeading: false),
      body: SafeArea(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: TaskWidget(
                  title: 'No title',
                  type: TaskType.analysis,
                ),
              );
            }),
      ),
    );
  }
}
