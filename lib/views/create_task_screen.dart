import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import '../core/widgets/app_background.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final title = TextEditingController();
  final desc = TextEditingController();
  int priority = 1;

  InputDecoration _inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white30),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<TaskViewModel>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Criar tarefa'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: AppBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 120, 24, 24),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: title,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputStyle('Título'),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: desc,
                  style: const TextStyle(color: Colors.white),
                  decoration: _inputStyle('Descrição'),
                ),
                const SizedBox(height: 30),

                const Text("Prioridade", style: TextStyle(color: Colors.white70, fontSize: 12)),
                DropdownButton<int>(
                  value: priority,
                  dropdownColor: Colors.grey[900],
                  style: const TextStyle(color: Colors.white),
                  underline: Container(height: 1, color: Colors.white30),
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(value: 1, child: Text('Baixa')),
                    DropdownMenuItem(value: 2, child: Text('Média')),
                    DropdownMenuItem(value: 3, child: Text('Alta')),
                  ],
                  onChanged: (v) => setState(() => priority = v!),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () async {
                    if (title.text.isNotEmpty) {
                      await vm.addTask(title.text, desc.text, priority);
                      if (mounted) Navigator.pop(context);
                    }
                  },
                  child: const Text('Salvar Tarefa', style: TextStyle(fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}