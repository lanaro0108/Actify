class TaskModel {
  final int? id;
  final String title;
  final String description;
  final int priority;
  final DateTime createdAt;
  bool isCompleted;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.createdAt,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'priority': priority,
    'createdAt': createdAt.toIso8601String(),
    'isCompleted': isCompleted ? 1 : 0,
  };

  factory TaskModel.fromMap(Map<String, dynamic> map) => TaskModel(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    priority: map['priority'],
    createdAt: DateTime.parse(map['createdAt']),
    isCompleted: map['isCompleted'] == 1,
  );
}