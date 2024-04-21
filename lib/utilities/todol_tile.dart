import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskIsCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  const ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskIsCompleted,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteTask,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(
                value: taskIsCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskIsCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
