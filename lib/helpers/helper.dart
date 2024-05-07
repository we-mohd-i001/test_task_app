import '../constants/constants.dart';

// Helper function to geticon according to the type
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
