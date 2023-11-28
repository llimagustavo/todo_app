import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: const Color.fromARGB(255, 46, 45, 45),
        leading: const Icon(Icons.check_box, color: tdBlue,
        ),
        title: const Text('Tomar banho', 
        style: TextStyle(
          color: tdBGColor,
          decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: GestureDetector(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(Icons.delete, 
            color: Colors.white),
          ),
          onTap: () {
            
          },
        ),
      ),
    );
  }
}