import 'package:get/get.dart';

class TaskListController extends GetxController {
  List<int> taskIds = [];
  void addTaskId(int id) {
    taskIds.add(id);
    update();
  }
}
