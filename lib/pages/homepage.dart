import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/utilities/dialogue_box.dart';
import 'package:todo_app/utilities/todol_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//open box
  final myBox = Hive.box('myBox');

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // if this is the first time opening the app
    if (myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //there already exists a data
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  //Checking for checkbox
  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  //Saving new tasks
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

//create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
            onSave: saveNewTask,
          );
        });
  }

//delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T O D O  A P P"),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.todoList[index][0],
              taskIsCompleted: db.todoList[index][1],
              onChanged: (value) => checkboxChanged(value, index),
              deleteTask: (context) => deleteTask(index),
            );
          }),
      backgroundColor: Colors.yellow[200],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}
