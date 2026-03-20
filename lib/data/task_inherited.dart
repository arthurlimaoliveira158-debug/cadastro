import 'package:flutter/material.dart';
import 'package:desafio_cadastro/components/task.dart';

class TaskInherited extends InheritedWidget {
  const TaskInherited({
    super.key,
    required super.child,
    required this.taskList,
    required this.onAddTask,
    required this.onRemoveTask,
  });

  final List<Task> taskList;
  final void Function(String name, int importancia) onAddTask;
  final void Function(int index) onRemoveTask;

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}