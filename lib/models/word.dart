class Word {
  int? id;
  final String topic;
  final String chapter;
  final String question;
  final String pinyin;

  Word(
      {required this.topic,//topic
      required this.chapter,//english
      required this.question,//character
      required this.pinyin});//pinyin

  Map<String, dynamic> toMap() {
    return {
      'topic': topic,
      'chapter': chapter,
      'character': question,
      'pinyin': pinyin
    };
  }

  factory Word.fromMap({required Map<String, dynamic> map}) {
    return Word(
        topic: map['topic'],
        chapter: map['chapter'],
        question: map['character'],
        pinyin: map['pinyin']);
  }
}
