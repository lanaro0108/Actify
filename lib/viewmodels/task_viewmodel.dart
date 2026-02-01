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


  Future<void> addTask(String title, String desc, int priority) async {
    final task = TaskModel(
      title: title,
      description: desc,
      priority: priority,
      createdAt: DateTime.now(),
    );


    await _repository.insertTask(task);
    await loadTasks();
  }


  Future<void> removeTask(int id) async {
    await _repository.deleteTask(id);
    await loadTasks();
  }


  Future<void> clearAll() async {
    await _repository.deleteAll();
    await loadTasks();
  }
}