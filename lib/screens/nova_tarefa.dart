import 'package:flutter/material.dart';

class NewTaskForm extends StatefulWidget {
  const NewTaskForm({super.key});

  @override
  State<NewTaskForm> createState() => _NewTaskFormState();
}

class _NewTaskFormState extends State<NewTaskForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController diffController = TextEditingController();
  TextEditingController imgController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          title: const Text(
            'Nova tarefa:',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green[300],
                  border: Border.all(
                    color: Colors.green,
                    width: 5,
                  ),
                  borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Digite um nome para a Tarefa!';
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        hintText: 'Nome',
                        fillColor: Colors.green[50],
                        filled: true,
                      ),
                      controller: nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty ||
                            int.parse(value) > 5 ||
                            int.parse(value) < 0) {
                          return 'Digite uma dificuldade entre 0 e 5!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        hintText: 'Dificuldade',
                        fillColor: Colors.green[50],
                        filled: true,
                      ),
                      controller: diffController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Digite um URL de imagem!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.url,
                      onChanged: (text) {
                        setState(() {});
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000))),
                        hintText: 'Imagem URL',
                        fillColor: Colors.green[50],
                        filled: true,
                      ),
                      controller: imgController,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        imgController.text,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const Icon(
                            Icons.image,
                            size: 80,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 75,
                      width: 75,
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print(nameController.text);
                            print(diffController.text);
                            print(imgController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(
                                  'Tarefa adicionada.',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
