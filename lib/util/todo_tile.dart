// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.isTaskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.pink[300]!,
              borderRadius: BorderRadius.circular(15),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChanged,
                activeColor: Colors.white,
                checkColor: Colors.blue,
              ),
              Text(
                taskName,
                style: TextStyle(
                    color: isTaskCompleted ? Colors.grey : Colors.white,
                    decoration: isTaskCompleted
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
