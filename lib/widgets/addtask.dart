import 'package:flutter/material.dart';
import 'package:todo/colors.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key, required this.addtaskFunction});

  final void Function(String newTodo) addtaskFunction;

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController _taskTextController = TextEditingController();
  FocusNode _taskFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _taskFocusNode
        .requestFocus(); // Set the focus on the text field when the widget is initialized
  }

  @override
  void dispose() {
    _taskFocusNode.dispose();
    _taskTextController
        .dispose(); // Don't forget to dispose of the text controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16.0,
          right: 16.0,
          top: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            const Text(
              'New Task',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  // Wrap the TextField with Expanded to make it take all available space
                  child: TextField(
                    controller: _taskTextController,
                    focusNode:
                        _taskFocusNode, // Assign the focus node to the text field
                    decoration: const InputDecoration(
                      hintText: 'Enter task...',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: tdRed, borderRadius: BorderRadius.circular(6)),
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    color: Colors.white,
                    onPressed: () {
                      widget.addtaskFunction(_taskTextController.text);
                       
                    },
                    icon: Icon(Icons.check),
                    iconSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}


