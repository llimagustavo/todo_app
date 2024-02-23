class ParaFazer{
  String? id;
  String? parafazerTexto;
  bool estaFeito;

  ParaFazer ({
    required this.id,
    required this.parafazerTexto,
    this.estaFeito = false,
  });

static List<ParaFazer> parafazerLista() {
  return [
    ParaFazer(id: '01', parafazerTexto: 'Exercício da manhã', estaFeito: true),
    ParaFazer(id: '02', parafazerTexto: 'Terminar o projeto de extensão', estaFeito: true),
    ParaFazer(id: '03', parafazerTexto: 'Jogar por 1 hora',),
    ParaFazer(id: '04', parafazerTexto: 'Ir para a faculdade',),
    ParaFazer(id: '05', parafazerTexto: 'Comprar a RTX 4090',),
    ];
  }
}