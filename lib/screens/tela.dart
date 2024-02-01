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
        leading: Icon(
          Icons.task_alt_rounded,
          color: Colors.white,
          size: 40,
        ),
        title: Text(
          'Tarefas:',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 250),
        child: Container(
          color: Colors.green[100],
          child: ListView(
            children: [
              Task(5, 'Aprender Flutter',
                  'https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096'),
              Task(2, 'Meditar',
                  'https://4.bp.blogspot.com/-9UBNrgGg-tk/VhrDzvW7DdI/AAAAAAAATT8/-QDGNJPh_fw/s1600/2.jpg'),
              Task(2, 'Andar de Bike',
                  'https://cdn.brujulabike.com/uploads/images/emtb_bicicleta_electrina_montana.jpg'),
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
        child: Icon(
          Icons.remove_red_eye_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
