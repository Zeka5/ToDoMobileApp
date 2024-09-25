import "package:flutter/material.dart";
import "package:todo_list_app/data/database.dart";
import "package:todo_list_app/util/dialog_box.dart";
import "package:todo_list_app/util/todo_tile.dart";
import "package:hive_flutter/hive_flutter.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // TODO: implement initState
    db.load();

    super.initState();
  }

  final myBox = Hive.openBox('mybox');

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          title: Center(
              child: Text(
            'TO DO',
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              isTaskCompleted: db.toDoList[index][1],
              onChanged: (value) => changeCheckBox(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }

  changeCheckBox(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.toDoList.insert(db.toDoList.length, db.toDoList[index]);
      db.toDoList.removeAt(index);
    });
    db.update();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
    db.update();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.update();
  }
}
