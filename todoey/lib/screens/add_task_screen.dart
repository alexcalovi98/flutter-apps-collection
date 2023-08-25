import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(width: 3, color: Colors.lightBlueAccent),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                  BorderSide(width: 3, color: Colors.lightBlueAccent),
                ),
              ),
            ),
            const SizedBox(height: 40),
            RawMaterialButton(
              constraints: const BoxConstraints.tightFor(height: 60),
              fillColor: Colors.lightBlueAccent,
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500
              ),
              onPressed: () {
                Navigator.pop(context, Task(controller.text));
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}