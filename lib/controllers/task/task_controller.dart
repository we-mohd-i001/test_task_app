import '../../constants/constants.dart';

class TaskController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  RxInt selectedHours = 0.obs;
  RxInt selectedMinutes = 0.obs;
  RxString? selectedTaskType = ''.obs;
  final RxList<String> tags = <String>[].obs;
  final TextEditingController tagController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController hourController = TextEditingController();

  List<DropdownMenuItem<String>>? getDropDownmenuItem() {
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

  void createTask() {}
}
