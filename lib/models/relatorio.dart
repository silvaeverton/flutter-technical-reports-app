class Relatorio {
  final String tecnico;
  final String descricao;
  final String data;

  Relatorio({
    required this.tecnico,
    required this.descricao,
    required this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'tecnico': tecnico,
      'descricao': descricao,
      'data': data,
    };
  }
}