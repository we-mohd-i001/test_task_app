import '../../constants/constants.dart';

class TaskController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  int selectedHours = 0;
  int selectedMinutes = 0;
  String? selectedTaskType;
  final RxList<String> tags = <String>[].obs;
  final TextEditingController tagController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController hourController = TextEditingController();

  final List<String> dropDownItems = [
    'Code Related',
    'UI Related',
    'Analysis',
    'Other'
  ];

  List<DropdownMenuItem<String>>? getDropDownmenuItem() {
    return dropDownItems.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  void createTask() {}
}
