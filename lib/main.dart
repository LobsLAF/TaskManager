import 'package:flutter/material.dart';
import 'package:todo_list/screens/tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Tarefas',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.green,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          ),
      home: const Tela(),
    );
  }
}
