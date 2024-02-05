import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/data/player_level.dart';
import 'package:todo_list/data/task_list.dart';
import 'package:todo_list/screens/new_task_form.dart';

// ignore: must_be_immutable
class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        leading: const Icon(
          Icons.task_alt_rounded,
          color: Colors.white,
          size: 40,
        ),
        title: Row(
          children: [
            const Text(
              'Tarefas:',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 160,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.green[300],
                  color: Colors.white,
                  value: Provider.of<PlayerLevel>(context).level/100,
                ),
              ),
            ),
            Text(
              'Lvl: ${Provider.of<PlayerLevel>(context).level.round()}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 70, top: 8),
        child: Column(
          children: Provider.of<TaskList>(context).taskList,
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
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
