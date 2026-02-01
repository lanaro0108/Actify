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
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Excluir tarefas')),
      body: AppBackground(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: vm.tasks.length,
          itemBuilder: (_, i) {
            final task = vm.tasks[i];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                title: Text(task.title),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
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
