import 'package:flutter/material.dart';
import '../data/models/task_model.dart';
import '../data/repositories/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();
  List<TaskModel> tasks = [];

  Future<void> loadTasks() async {
    tasks = await _repository.getTasks();
    notifyListeners();
  }

  Future<void> addTask(String title, String description, int priority) async {
    final newTask = TaskModel(
      title: title,
      description: description,
      priority: priority,
      createdAt: DateTime.now(),
    );
    await _repository.insertTask(newTask);
    await loadTasks();
  }

  Future<void> toggleTaskStatus(TaskModel task) async {
    task.isCompleted = !task.isCompleted;
    await _repository.updateTask(task);
    notifyListeners();
  }

  Future<void> removeTask(int id) async {
    await _repository.deleteTask(id);
    await loadTasks();
  }
}