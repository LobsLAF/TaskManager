import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';
import 'package:todo_list/data/task_dao.dart';

class DeleteTaskDialog extends StatelessWidget {
  const DeleteTaskDialog({
    super.key,
    required this.widget,
  });

  final Task widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 30,
      content: const Icon(
        Icons.delete_forever,
        size: 60,
        color: Colors.black,
      ),
      title: const Text(
        'Deseja apagar essa tarefa?',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              TaskDao().delete(widget.nome);
              Navigator.of(context).pop();
            },
            child: const Text('Sim')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Não'))
      ],
    );
  }
}