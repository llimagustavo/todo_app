import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const ToDoItem({super.key, 
  required this.todo, 
  required this.onToDoChanged, 
  required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: const Color.fromARGB(255, 46, 45, 45),
        leading: Icon(
          todo.isDone? Icons.check_box : Icons.check_box_outline_blank, 
          color: corAzul,
        ),
        title: Text(todo.todoText!, 
        style: TextStyle(
          color: corBranca,
          decoration: todo.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: GestureDetector(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: corVermelha,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(Icons.delete, 
            color: Colors.white),
          ),
          onTap: () {
            onDeleteItem(todo.id);
          },
        ),
      ),
    );
  }
}