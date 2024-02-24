import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/tarefa.dart';

class ItemParaFazer extends StatelessWidget {
  final Tarefa parafazer;
  final quandoClicar;
  final deletarItem;
  final editarTarefa;

  const ItemParaFazer({super.key, 
  required this.parafazer, 
  required this.quandoClicar, 
  required this.deletarItem,
  required this.editarTarefa,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          quandoClicar(parafazer);
        },
        onLongPress: () {
          editarTarefa(parafazer);
          // Adicionar função de alteração de texto mais tarde
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: const Color.fromARGB(255, 46, 45, 45),
        leading: Icon(
          parafazer.estaFeito? Icons.check_box : Icons.check_box_outline_blank, 
          color: corAzul,
        ),
        title: Text(parafazer.tarefaTexto!, 
        style: TextStyle(
          color: corBranca,
          decoration: parafazer.estaFeito? TextDecoration.lineThrough : null,
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
            deletarItem(parafazer.id);
          },
        ),
      ),
    );
  }
}