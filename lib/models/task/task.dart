import 'task_type.dart';

class Task {
  final String id;
  final String title;
  final TaskType type;
  final int hours;
  final int minutes;
  final int seconds;
  final String description;

  bool get isDone => (hours == 0 && minutes == 0 && seconds == 0);

  Task({
    required this.id,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.title,
    required this.type,
    required this.description,
  });

  Task copyWith({
    String? id,
    String? title,
    TaskType? type,
    int? hours,
    int? minutes,
    int? seconds,
    String? description,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
      description: description ?? this.description,
    );
  }
}
