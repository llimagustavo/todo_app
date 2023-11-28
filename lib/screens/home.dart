import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBlack,
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: const Center(
                        child: Text('Tarefas', style: TextStyle(
                          color: tdBGColor, fontSize: 30, fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    ToDoItem(),
                    ToDoItem(),
                    ToDoItem(),
                    ToDoItem(),
                    ToDoItem(),
                    ToDoItem(),
                ],),
              ),
            ],
          ),
        )
      );
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(88, 0, 0, 0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: tdBGColor, size: 20,),
          hintText: 'Pesquisar',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBlack,
      title: 
        const Icon(
          Icons.menu,
          color: tdBGColor,
          size: 30,
        ),
      actions: [ClipRRect(
        child: Image.asset('assets/images/avatar.png'),
      )],
    );
  }
}