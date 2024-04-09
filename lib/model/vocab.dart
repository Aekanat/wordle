class vocab {
  final String word;
  final String definition;

  vocab({
    required this.word,
    required this.definition,
  });

  factory vocab.fromJson(Map<String, dynamic> json) {
    String word = json['word'];
    String definition = json['meanings'][0]['definitions'][0]['definition'];

    return vocab(
      word: word,
      definition: definition,
    );
  }
}
