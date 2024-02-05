import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/data/task_list.dart';
import 'package:todo_list/screens/new_task_form.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 70, top: 8),
          child: Column(
            children: Provider.of<TaskList>(context).taskList,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (newContext) => NewTaskForm(
                taskContext: context,
              ),
            ),
          ).then((value) => () {
                setState(() {});
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
