import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/parafazer.dart';
import 'package:todo_app/widgets/parafazer_item.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final parafazeralista = ParaFazer.parafazerLista();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPreta,
        appBar: _appBar(),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  caixadePesquisa(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            top: 40,
                            bottom: 30,
                          ),
                          child: const Center(
                            child: Text('Todas as tarefas', style: TextStyle(
                              color: corBranca, fontSize: 30, fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        for (ParaFazer todoo in parafazeralista)
                        ItemParaFazer(
                          parafazer: todoo,
                          quandoClicar: _handleToDoChange,
                          deletarItem: _deletarItemParaFazer,
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
                        color: corPreta,
                        boxShadow: const [BoxShadow(
                          color: corCinza,
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
                            color: corBranca,
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
                        backgroundColor: corAzul,
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


  void _handleToDoChange(ParaFazer todo) {
    setState(() {
      todo.estaFeito = !todo.estaFeito;
    });
  }

  void _deletarItemParaFazer(String id) {
    setState(() {
      parafazeralista.removeWhere((item) => item.id == id);
    });
  }

  Widget caixadePesquisa() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(88, 0, 0, 0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const TextField(
        style: TextStyle(
          color: corBranca),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search, 
            color: corBranca, 
            size: 20),
          hintText: 'Pesquisar',
          hintStyle: TextStyle(color: corCinza),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: corPreta,
      title: 
        const Icon(
          Icons.menu,
          color: corBranca,
          size: 30,
        ),
      actions: [
          ClipRRect(
        child: Image.asset('assets/images/avatar.png'),
        ),
      ],
    );
  }
}