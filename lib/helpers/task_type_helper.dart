import '../constants/constants.dart';
import '../models/task/task_type.dart';

TaskType taskType(String selectedTaskType) {
  switch (selectedTaskType) {
    case AppStrings.codeRelated:
      return TaskType.codeRelated;
    case AppStrings.uiRelated:
      return TaskType.uiRelated;
    case AppStrings.analysis:
      return TaskType.analysis;
    case AppStrings.other:
      return TaskType.other;
    default:
      return TaskType.other;
  }
}
