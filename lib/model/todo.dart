class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo ({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

static List<ToDo> todoList() {
  return [
    ToDo(id: '01', todoText: 'Exercício da manhã', isDone: true),
    ToDo(id: '02', todoText: 'Terminar o projeto de extensão', isDone: true),
    ToDo(id: '03', todoText: 'Jogar por 1 hora',),
    ToDo(id: '04', todoText: 'Ir para a faculdade',),
    ToDo(id: '05', todoText: 'Comprar a RTX 4090',),
    ];
  }
}