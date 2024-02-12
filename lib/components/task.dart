import 'package:flutter/material.dart';
import 'package:todo_list/components/delete_task_dialog.dart';
import 'package:todo_list/components/difficulty.dart';
import 'package:todo_list/data/task_dao.dart';

// ignore: must_be_immutable
class Task extends StatefulWidget {
  Task(this.dificuldade, this.nome, this.imagem, {this.nivel = 0, super.key});

  final String nome;
  final String imagem;
  final int dificuldade;

  int nivel;
  int maestria = 0;
  Color taskColor = Colors.green;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool useNetwork() {
    return widget.imagem.contains('http');
  }

  static const double borderRadius = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: getTaskColor(),
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(borderRadius)),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            topLeft: Radius.circular(borderRadius)),
                      ),
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            topLeft: Radius.circular(borderRadius)),
                        child: useNetwork()
                            ? Image.network(
                                widget.imagem,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return const Icon(
                                    Icons.image,
                                    size: 50,
                                  );
                                },
                              )
                            : Image.asset(
                                widget.imagem,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return const Icon(
                                    Icons.image,
                                    size: 50,
                                  );
                                },
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 190,
                          child: Text(
                            textAlign: TextAlign.center,
                            widget.nome,
                            style: const TextStyle(
                                fontSize: 22, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: ((context) {
                                return DeleteTaskDialog(widget: widget);
                              }),
                            );
                          },
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                            // print(nivel);
                            TaskDao().save(widget);
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.arrow_upward_sharp,
                                color: Colors.white,
                              ),
                              Text(
                                'Lvl up',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.green[300],
                        color: Colors.white,
                        value: widget.nivel / (widget.dificuldade * 10) % 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nível ${widget.nivel}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  getTaskColor() {
    int maestria = (widget.nivel / (10 * widget.dificuldade)).floor();

    if (maestria == 0) {
      return Colors.green;
    } else if (maestria == 1) {
      return const Color.fromARGB(255, 208, 147, 117);
    } else if (maestria == 2) {
      return Colors.grey;
    } else if (maestria >= 3) {
      return Colors.yellow[700]!;
    }
  }
}
