import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["An Example", false],
    ];
  }

  void load() {
    toDoList = myBox.get("TODOLIST", defaultValue: []);
  }

  void update() {
    myBox.put("TODOLIST", toDoList);
  }
}
