import 'package:flutter/material.dart';

import '../models/task/task_type.dart';

// Helper function to get icon according to the task type
IconData getIcon(TaskType type) {
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
