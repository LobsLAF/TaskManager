import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required super.child});

  final List<Task> taskList = [
    Task(5, 'Aprender Flutter', 'assets/images/flutter.jpg'),
    Task(2, 'Meditar', 'assets/images/cuja.jpg'),
    Task(2, 'Andar de Bike', 'assets/images/bike.webp'),
  ];

  void newTask(int diff, String name, String img) {
    taskList.add(Task(diff, name, img));
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert (result != null, 'No TaskInherited found in context');
    return result!;
  }
}
