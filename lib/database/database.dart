import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];
//reference box

  final myBox = Hive.box('myBox');

  //Run this for 1st time opening the app

  void createInitialData() {
    todoList = [
      ["Hit the Gym", false],
      ["Build that passion project", false]
    ];
  }

  //load up database
  void loadData() {
    todoList = myBox.get('TODOLIST');
  }

  //update the database
  void updateData() {
    myBox.put("TODOLIST", todoList);
  }
}
