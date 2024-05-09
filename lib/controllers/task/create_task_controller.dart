import '../../constants/constants.dart';
import '../../models/task/task.dart';

class TaskController extends GetxController {
  RxList<Task> taskList = <Task>[].obs;
  RxInt selectedHours = 0.obs;
  RxInt selectedMinutes = 0.obs;
  RxString selectedTaskType = 'Other'.obs;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController hourController = TextEditingController();

  void createTask() {
    Task task = Task(
      id: '',
      title: titleController.text,
      type: taskType,
      description: description,
      hours: selectedHours.value,
      minutes: selectedMinutes.value,
      seconds: 0,
    );
    taskList.add(task);
  }

  void upateTask(Task task, index) {
    taskList[index] = task;
  }

  String get description {
    return descriptionController.text;
  }

  TaskType get taskType {
    switch (selectedTaskType.value) {
      case 'Code Related':
        return TaskType.codeRelated;
      case 'UI Related':
        return TaskType.uiRelated;
      case 'Analysis':
        return TaskType.analysis;
      case 'Other':
        return TaskType.other;
      default:
        return TaskType.other;
    }
  }

  List<DropdownMenuItem<String>>? getDropDownMenuItem() {
    final List<String> dropDownItems = [
      'Code Related',
      'UI Related',
      'Analysis',
      'Other'
    ];
    return dropDownItems.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    hourController.clear();
    minutesController.clear();
    selectedTaskType.value = 'Other';
    selectedHours.value = 0;
    selectedMinutes.value = 0;
  }
}
