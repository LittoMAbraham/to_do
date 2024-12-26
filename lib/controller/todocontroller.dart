import 'package:hive_flutter/adapters.dart';
import 'package:to_do/model/todomodel.dart';

class TodoController {
  static List todolistKey = [];

  static var myBox = Hive.box<TodoModel>('todo');

  static deleteData(var Key) async {
    await myBox.delete(Key);
    initKey();
  }

  static addData(TodoModel item) async {
    await myBox.add(item);
    initKey();
  }

  static initKey() {
    todolistKey = myBox.keys.toList();
  }

  static TodoModel? getdata(var key) {
    return myBox.get(key);
  }
}