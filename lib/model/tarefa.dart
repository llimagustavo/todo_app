class Tarefa{
  String? id;
  String? tarefaTexto;
  bool estaFeito;

  Tarefa ({
    required this.id,
    required this.tarefaTexto,
    this.estaFeito = false,
  });

static List<Tarefa> listadeTarefas() {
  return [
    Tarefa(id: '01', tarefaTexto: 'Ir para a academia', estaFeito: true),
    Tarefa(id: '02', tarefaTexto: 'Terminar o projeto de extensão', estaFeito: true),
    Tarefa(id: '03', tarefaTexto: 'Jogar por 1 hora',),
    Tarefa(id: '04', tarefaTexto: 'Ir para a faculdade',),
    Tarefa(id: '05', tarefaTexto: 'Comprar cebola',),
    ];
  }
}