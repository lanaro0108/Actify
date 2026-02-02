import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import '../core/widgets/app_background.dart';

class DeleteTaskScreen extends StatelessWidget {
  const DeleteTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TaskViewModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Excluir tarefas'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AppBackground(
        child: vm.tasks.isEmpty
            ? const Center(
          child: Text(
              "Nada para excluir!",
              style: TextStyle(color: Colors.white70)
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
          itemCount: vm.tasks.length,
          itemBuilder: (_, i) {
            final task = vm.tasks[i];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: ListTile(
                title: Text(
                  task.title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),
                ),
                subtitle: Text(
                  task.description,
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.close, color: Colors.redAccent),
                  onPressed: () => vm.removeTask(task.id!),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}