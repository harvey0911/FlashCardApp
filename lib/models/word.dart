class Word {
  int? id;
  final String topic;
  final String chapter;
  final String character;
  final String pinyin;

  Word(
      {required this.topic,
      required this.chapter,//subject
      required this.character,//question
      required this.pinyin});//answer

  Map<String, dynamic> toMap() {
    return {
      'topic': topic,
      'chapter': chapter,
      'character': character,
      'pinyin': pinyin
    };
  }

  factory Word.fromMap({required Map<String, dynamic> map}) {
    return Word(
        topic: map['topic'],
        chapter: map['chapter'],
        character: map['character'],
        pinyin: map['pinyin']);
  }
}
