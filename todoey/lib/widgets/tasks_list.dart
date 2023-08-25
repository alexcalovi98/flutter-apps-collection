import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
    required this.toggleTaskRequest,
  });

  final List<Task> tasks;
  final Function(int index) toggleTaskRequest;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => TaskTile(
        task: tasks[index],
        onCheckBoxChange: () => toggleTaskRequest(index),
      ),
      itemCount: tasks.length,
    );
  }
}
