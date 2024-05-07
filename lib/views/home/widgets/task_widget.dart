import '../../../constants/constants.dart';
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
            constraints: const BoxConstraints(
                maxHeight: 100, minWidth: 130, maxWidth: 300, minHeight: 100),
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
        ],
      ),
    );
  }
}

IconData? getIcon(type) {
  switch (type) {
    case TaskType.uiRelated:
      return Icons.design_services_outlined;
    case TaskType.codeRelated:
      return Icons.code_outlined;
    case TaskType.analysis:
      return Icons.analytics;
    case TaskType.other:
      return Icons.sticky_note_2_rounded;
  }
}
