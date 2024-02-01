import 'package:flutter/material.dart';
import 'package:todo_list/components/task.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  bool opacidade = true;

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
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: Container(
          color: Colors.green[100],
          child: ListView(
            children: const [
              Task(5, 'Aprender Flutter',
                  'assets/images/flutter.jpg'),
              Task(2, 'Meditar',
                  'assets/images/cuja.jpg'),
              Task(2, 'Andar de Bike',
                  'assets/images/bike.webp'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(
          Icons.remove_red_eye_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
