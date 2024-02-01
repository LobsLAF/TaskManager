import 'package:flutter/material.dart';
import 'package:todo_list/screens/tela.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Tarefas',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.green,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
          ),
          iconTheme: IconThemeData(color: Colors.white),
          ),
      home: Tela(),
    );
  }
}
