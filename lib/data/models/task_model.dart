class TaskModel {
  final int? id;
  final String title;
  final String description;
  final int priority;
  final DateTime createdAt;


  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.createdAt,
  });


  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'priority': priority,
    'createdAt': createdAt.toIso8601String(),
  };


  factory TaskModel.fromMap(Map<String, dynamic> map) => TaskModel(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    priority: map['priority'],
    createdAt: DateTime.parse(map['createdAt']),
  );
}