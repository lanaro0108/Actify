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

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();

    return Scaffold(
      backgroundColor: Colors.transparent, // 👈 obrigatório
      appBar: AppBar(title: Text('Bom dia, ${widget.userName}')),
      body: AppBackground( // 👈 imagem aplicada aqui
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: vm.tasks.length,
          itemBuilder: (_, i) {
            final task = vm.tasks[i];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => vm.removeTask(task.id!),
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
