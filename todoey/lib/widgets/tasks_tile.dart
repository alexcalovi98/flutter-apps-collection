import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.onCheckBoxChange,
  });

  final Task task;
  final Function() onCheckBoxChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          task.text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            decoration: task.done ? TextDecoration.lineThrough : null,
          ),
        ),
        Checkbox(
          value: task.done,
          activeColor: Colors.lightBlueAccent,
          onChanged: (value) {
            if (value != null) onCheckBoxChange();
          },
        ),
      ],
    );
  }
}
