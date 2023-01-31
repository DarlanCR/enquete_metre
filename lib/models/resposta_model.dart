// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Resposta {
  final int idEnquete;
  final int idEnqueteQuestao;
  final String resposta;
  final int? nota;

  Resposta(
      {required this.idEnquete,
      required this.idEnqueteQuestao,
      required this.resposta,
      required this.nota});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idEnquete': idEnquete,
      'idEnqueteQuestao': idEnqueteQuestao,
      'resposta': resposta == '' ? null : resposta,
      'nota': nota,
    };
  }

  String toJson() => json.encode(toMap());
}
