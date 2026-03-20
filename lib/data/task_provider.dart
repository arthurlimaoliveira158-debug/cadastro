import 'package:flutter/material.dart';
import 'package:desafio_cadastro/components/task.dart';
import 'package:desafio_cadastro/data/task_inherited.dart';

class TaskProvider extends StatefulWidget {
  final Widget child;

  const TaskProvider({super.key, required this.child});

  @override
  State<TaskProvider> createState() => _TaskProviderState();
}

class _TaskProviderState extends State<TaskProvider> {
  final List<Task> _taskList = [];

  void _addTask(String name, int importancia) {
    setState(() {
      _taskList.add(Task(name, importancia));
    });
  }

  void _removeTask(int index) {
    setState(() {
      _taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskInherited(
      taskList: _taskList,
      onAddTask: _addTask,
      onRemoveTask: _removeTask,
      child: widget.child,
    );
  }
}