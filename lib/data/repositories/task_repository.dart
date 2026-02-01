import '../database/app_database.dart';
import '../models/task_model.dart';


class TaskRepository {
  Future<void> insertTask(TaskModel task) async {
    final db = await AppDatabase.database;
    await db.insert('tasks', task.toMap());
  }


  Future<List<TaskModel>> getTasks() async {
    final db = await AppDatabase.database;
    final maps = await db.query('tasks', orderBy: 'priority DESC, createdAt DESC');


    return maps.map((e) => TaskModel.fromMap(e)).toList();
  }


  Future<void> deleteTask(int id) async {
    final db = await AppDatabase.database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }


  Future<void> deleteAll() async {
    final db = await AppDatabase.database;
    await db.delete('tasks');
  }
}