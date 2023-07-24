import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/widgets/addtask.dart';
import 'package:todo/widgets/todo_item.dart';
import 'package:todo/model/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<TodoModel> todos = [
    TodoModel('task 1'),
    TodoModel('task 2'),
    TodoModel('task 3'),
    TodoModel('task 4'),
    TodoModel('task 5')
  ];
  

  

  void _addTask(String newTask){

      setState((){
        todos.add(TodoModel(newTask));
      });
      Navigator.of(context).pop();

  }

  void _showModal(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        
      ),
      isScrollControlled: true,
      backgroundColor: tdBGColor,
      context: context,
      builder: (ctx) => AddTask(addtaskFunction: _addTask));
}


@override
  void initState() {
    
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
            ),
            Container(
              width: 40,
              height: 40,
              color: Colors.blue,
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20, minWidth: 25),
                  border: InputBorder.none,
                  hintText: 'search',
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 15.0),
            child: const Text(
              'Tasks',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(child: Todo(todoArray: todos.reversed.toList())),
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModal(context);
        },
        child: Icon(Icons.add),
        backgroundColor: tdBlue, 
        shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)
        ),
        
      ) ,// Change the background color as needed
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


