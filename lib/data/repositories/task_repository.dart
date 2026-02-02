import '../database/app_database.dart';
import '../models/task_model.dart';

class TaskRepository {
  Future<List<TaskModel>> getTasks() async {
    final db = await AppDatabase.database;
    final List<Map<String, dynamic>> maps = await db.query('tasks', orderBy: 'createdAt DESC');
    return List.generate(maps.length, (i) => TaskModel.fromMap(maps[i]));
  }

  Future<void> insertTask(TaskModel task) async {
    final db = await AppDatabase.database;
    await db.insert('tasks', task.toMap());
  }

  Future<void> updateTask(TaskModel task) async {
    final db = await AppDatabase.database;
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await AppDatabase.database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}