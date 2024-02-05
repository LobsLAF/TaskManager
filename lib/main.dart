import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/data/task_list.dart';
import 'package:todo_list/screens/tela.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskList(),
      child: MyApp(),
    ),
  );
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
