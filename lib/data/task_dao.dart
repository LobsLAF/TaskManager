import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/components/task.dart';
import 'package:todo_list/data/database.dart';

class TaskDao {
//Database field names:
  static const String _tableName = 'TaskTable';
  static const String _name = 'name';
  static const String _diff = 'diff';
  static const String _img = 'img';
  static const String _lvl = 'lvl';

//Database code:
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_diff INTEGER, '
      '$_img TEXT, '
      '$_lvl INTEGER)';

  save(Task tarefa) async {
    //print('Salvando...');
    final Database database = await getDatabase();
    List<Task> itemExists = await find(tarefa.nome);

    Map<String, dynamic> taskMap = toMap(tarefa);

    if (itemExists.isEmpty) {
      //print('Essa tarefa não existe. Criando...');
      return await database.insert(_tableName, taskMap);
    } else {
      //print('Essa tarefa existe! Atualizando...');
      await database.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
      //print('Nível da tarefa: ${await getNivel(tarefa.nome)}');
      //print(toMap(tarefa));
    }
  }

  Future<List<Task>> findAll() async {
    //print('Iniciando o findAll()');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    //print('Dados encontrados: $result');
    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    //print('Iniciando o find()');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    //print('Encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    //print('Deletando.');
    final Database database = await getDatabase();
    database.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }

  List<Task> toList(List<Map<String, dynamic>> mapList) {
    //print('Convertendo para Lista...');
    List<Task> result = [];

    for (Map<String, dynamic> linha in mapList) {
      final Task tarefa =
          Task(linha[_diff], linha[_name], linha[_img], nivel: linha[_lvl]);
      result.add(tarefa);
    }
    //print('Lista de tarefas: $result');

    return result;
  }

  Map<String, Object?> toMap(Task tarefa) {
    //print('Convertendo para map');

    final Map<String, dynamic> mapa = {};
    mapa[_name] = tarefa.nome;
    mapa[_diff] = tarefa.dificuldade;
    mapa[_img] = tarefa.imagem;
    mapa[_lvl] = tarefa.nivel;

    return mapa;
  }

  Future<int> getNivel(String nome) async {
    List<Task> tasks = await find(nome);
    Task? task = tasks.firstOrNull;

    if (task != null) {
      return task.nivel;
    } else {
      return -1;
    }
  }

  final _tasksStreamController = BehaviorSubject<List<Task>>();

  TaskDao() {
    create();
  }

  create() async {
    _tasksStreamController.add(await findAll());

    final Database database = await getDatabase();
    database.query(_tableName).asStream().listen((event) async {
      _tasksStreamController.add(await findAll());
    });
  }

  Stream<List<Task>> streamTasks() {
    return _tasksStreamController.stream;
  }

  Future<void> dispose() async {
    await _tasksStreamController.close();
  }
}
