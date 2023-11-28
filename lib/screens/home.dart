import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBlack,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Padding(
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
                            top: 40,
                            bottom: 20,
                          ),
                          child: const Center(
                            child: Text('Tarefas', style: TextStyle(
                              color: tdBGColor, fontSize: 30, fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),

                        for (ToDo todoo in todosList)
                        ToDoItem(
                          todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                          ),
                        
                    ],),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20
                      ),
                      decoration: BoxDecoration(
                        color: tdBlack,
                        boxShadow: const [BoxShadow(
                          color: tdGrey,
                          blurRadius: 10,
                          spreadRadius: 0.0,
                        )],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Adicionar uma tarefa',
                          hintStyle: TextStyle(
                            color: tdBGColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: const Size(50, 60),
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        elevation: 10,
                      ),
                      child: const Icon(
                        Icons.add, 
                        color: Colors.white, size: 25),
                        onPressed: () {
                          
                      },
                    ),
                  ),
              ],),
            ),
          ],
        )
      );
  }


  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
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