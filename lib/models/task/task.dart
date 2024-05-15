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

Task task1 = Task(
    id: '',
    hours: 5,
    minutes: 5,
    seconds: 5,
    title: 'Some Title',
    type: TaskType.codeRelated,
    description:
        'When using Lorem Ipsum for creating dummy content for your newly created website, you can select the text formats you want from the tool. Like, words, sentences, or paragraphs.'
        'Then, you can select whether you want HTML markup in your dummy content or not'
        'Then, you can choose the number of words and paragraphs for your dummy content and execute the plan accordingly.'
        'You can use this tool at incrementors.com for free.');
Task task2 = Task(
    id: '',
    hours: 5,
    minutes: 5,
    seconds: 5,
    title: 'Some Title',
    type: TaskType.uiRelated,
    description:
        'When using Lorem Ipsum for creating dummy content for your newly created website, you can select the text formats you want from the tool. Like, words, sentences, or paragraphs.'
        'Then, you can select whether you want HTML markup in your dummy content or not'
        'Then, you can choose the number of words and paragraphs for your dummy content and execute the plan accordingly.'
        'You can use this tool at incrementors.com for free.');
Task task3 = Task(
    id: '',
    hours: 5,
    minutes: 5,
    seconds: 5,
    title: 'Some Title',
    type: TaskType.analysis,
    description:
        'When using Lorem Ipsum for creating dummy content for your newly created website, you can select the text formats you want from the tool. Like, words, sentences, or paragraphs.'
        'Then, you can select whether you want HTML markup in your dummy content or not'
        'Then, you can choose the number of words and paragraphs for your dummy content and execute the plan accordingly.'
        'You can use this tool at incrementors.com for free.');
Task task4 = Task(
    id: '',
    hours: 5,
    minutes: 5,
    seconds: 5,
    title: 'Some Title',
    type: TaskType.other,
    description:
        'When using Lorem Ipsum for creating dummy content for your newly created website, you can select the text formats you want from the tool. Like, words, sentences, or paragraphs.'
        'Then, you can select whether you want HTML markup in your dummy content or not'
        'Then, you can choose the number of words and paragraphs for your dummy content and execute the plan accordingly.'
        'You can use this tool at incrementors.com for free.');
