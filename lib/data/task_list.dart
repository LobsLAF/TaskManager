import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';

class TaskList with ChangeNotifier {

  final List<Task> _taskList = [
    Task(5, 'Aprender Flutter', 'assets/images/flutter.jpg'),
    Task(2, 'Meditar', 'assets/images/cuja.jpg'),
    Task(2, 'Andar de Bike', 'assets/images/bike.webp'),
  ];

  List<Task> get taskList => _taskList;

  void newTask(int diff, String name, String img) {
    _taskList.add(Task(diff, name, img));
    notifyListeners();
  }
}
