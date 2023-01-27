class Enquete {
  final int idEnquete;
  final int idEnqueteQuestao;
  final String questao;
  final int sequencia;
  final String tipoQuestao;

  Enquete({
    required this.idEnquete,
    required this.idEnqueteQuestao,
    required this.questao,
    required this.sequencia,
    required this.tipoQuestao,
  });

  factory Enquete.fromMap(Map<String, dynamic> json) {
    return Enquete(
        idEnquete: json['idEnquete'],
        idEnqueteQuestao: json['idEnqueteQuestao'],
        questao: json['questao'],
        sequencia: json['sequencia'],
        tipoQuestao: json['tipoQuestao']);
  }
}
