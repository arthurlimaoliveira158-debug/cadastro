import 'package:flutter/material.dart';
import 'package:desafio_cadastro/data/task_inherited.dart';

class listSave extends StatefulWidget {
  const listSave({Key? key}) : super(key: key);

  @override
  State<listSave> createState() => _listSaveState();
}

class _listSaveState extends State<listSave> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    final inherited = TaskInherited.of(context);
    final taskList = inherited.taskList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "save");
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: taskList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.checklist_rounded,
                      size: 64,
                      color: Color(0xFFE53935),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Nenhuma tarefa ainda.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Toque em + para adicionar.',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 12, bottom: 80),
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(index.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.red.shade900,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (_) {
                      inherited.onRemoveTask(index);
                    },
                    child: taskList[index],
                  );
                },
              ),
      ),
    );
  }
}