import 'package:flutter/material.dart';
import 'package:todo/colors.dart';
import 'package:todo/model/todo.dart';


class Todo extends StatefulWidget {
   Todo({super.key, required this.todoArray});

  final List<TodoModel> todoArray;

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
 

  
  

  void _taskDone(TodoModel todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      
    });
  }

  void _removeItem(TodoModel todo){
    setState(() {
      widget.todoArray.remove(todo);
    });
  }


  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todoArray.length,
      itemBuilder: (ctx, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          onTap: (){},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          tileColor: Colors.white,
          leading: GestureDetector(
            onTap: (){_taskDone(widget.todoArray[index]);},
            child: Icon(
              widget.todoArray[index].isDone
                  ? Icons.check_box_rounded
                  : Icons.check_box_outline_blank_rounded,
              color: tdBlue,
              size: 30,
            ),
          ),
          title: Text(
           widget.todoArray[index].name.toString(),
            style: TextStyle(
                fontSize: 18,
                decoration: widget.todoArray[index].isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Container(
          
            padding: EdgeInsets.all(0),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                
                color: tdRed, borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              padding: EdgeInsets.all(0),
              color: Colors.white,
              onPressed: () {_removeItem(widget.todoArray[index]);},
              icon: Icon(Icons.delete),
              iconSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}



