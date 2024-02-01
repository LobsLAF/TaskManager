import 'package:flutter/material.dart';
import 'package:todo_list/components/difficulty.dart';

class Task extends StatefulWidget {
  const Task(this.dificuldade, this.nome, this.imagem, {super.key});

  final String nome;
  final String imagem;
  final int dificuldade;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  int maestria = 0;
  Color taskColor = Colors.green;
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
              color: taskColor,
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
                        color: Colors.grey,
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
                        child: Image.asset(
                          widget.imagem,
                          fit: BoxFit.cover,
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
                                fontSize: 22,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.dificuldade,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              if (nivel < 10 * widget.dificuldade) {
                                nivel++;
                              } else if (maestria != 3){
                                nivel = 1;
                                maestria++;

                                if (maestria == 1) {
                                  taskColor = Color.fromARGB(255, 208, 147, 117);
                                } else if (maestria == 2) {
                                  taskColor = Colors.grey;
                                } else if (maestria == 3) {
                                  taskColor = Colors.yellow[700]!;
                                }
                              }
                            });
                            // print(nivel);
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
                        value: (widget.dificuldade > 0)
                            ? nivel / 10 / widget.dificuldade
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nível $nivel',
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
}
