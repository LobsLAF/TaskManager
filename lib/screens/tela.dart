import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';
import 'package:todo_list/data/task_inherited.dart';
import 'package:todo_list/screens/nova_tarefa.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.task_alt_rounded,
          color: Colors.white,
          size: 40,
        ),
        title: const Text(
          'Tarefas:',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.green[100],
        child: ListView(
          children: TaskInherited.of(context).taskList
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (newContext) => NewTaskForm(taskContext: context)));
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
