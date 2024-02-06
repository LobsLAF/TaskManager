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
    print('Salvando...');
    final Database database = await getDatabase();
    List<Task> itemExists = await find(tarefa.nome);

    Map<String, dynamic> taskMap = toMap(tarefa);

    if (itemExists.isEmpty) {
      print('Essa tarefa não existe. Criando...');
      return await database.insert(_tableName, taskMap);
    } else {
      print('Essa tarefa existe! Atualizando...');
      return await database.update(
        _tableName,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Future<List<Task>> findAll() async {
    print('Iniciando o findAll()');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    print('Dados encontrados: $result');
    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('Iniciando o find()');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Encontrado: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {}

  List<Task> toList(List<Map<String, dynamic>> mapList) {
    print('Convertendo para Lista...');
    List<Task> result = [];

    for (Map<String, dynamic> linha in mapList) {
      final Task tarefa = Task(linha[_diff], linha[_name], linha[_img]);
      result.add(tarefa);
    }
    print('Lista de tarefas: $result');

    return result;
  }

  Map<String, Object?> toMap(Task tarefa) {
    print('Convertendo para map');

    final Map<String, dynamic> mapa = {};
    mapa[_name] = tarefa.nome;
    mapa[_diff] = tarefa.dificuldade;
    mapa[_img] = tarefa.imagem;
    mapa[_lvl] = tarefa.nivel;

    return mapa;
  }
}
