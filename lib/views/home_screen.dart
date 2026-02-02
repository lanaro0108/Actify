import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import 'create_task_screen.dart';
import 'delete_task_screen.dart';
import '../core/widgets/app_background.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<TaskViewModel>().loadTasks());
  }

  Color _getPriorityColor(int priority) {
    switch (priority) {
      case 3: return Colors.redAccent;
      case 2: return Colors.orangeAccent;
      case 1: return Colors.greenAccent;
      default: return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Bom dia, ${widget.userName}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AppBackground(
        child: vm.tasks.isEmpty
            ? const Center(child: Text("Nenhuma tarefa por aqui!", style: TextStyle(color: Colors.white70)))
            : ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          itemCount: vm.tasks.length,
          itemBuilder: (_, i) {
            final task = vm.tasks[i];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(task.isCompleted ? 0.05 : 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(
                    task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: _getPriorityColor(task.priority),
                  ),
                  onPressed: () => vm.toggleTaskStatus(task),
                ),
                title: Text(
                  task.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(
                  task.description,
                  style: TextStyle(
                    color: Colors.white70,
                    decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.priority == 3 ? 'Alta' : task.priority == 2 ? 'Média' : 'Baixa',
                      style: TextStyle(
                        color: _getPriorityColor(task.priority),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white54, size: 20),
                      onPressed: () => vm.removeTask(task.id!),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            child: const Icon(Icons.add),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateTaskScreen()),
            ),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'delete',
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete_forever),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DeleteTaskScreen()),
            ),
          ),
        ],
      ),
    );
  }
}