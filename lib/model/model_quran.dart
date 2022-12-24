class ModelQuran {
  int? surah_number;
  int? verse_number;
  String? text;
  String? translation;

  ModelQuran(this.surah_number, this.verse_number, this.text, this.translation);

  ModelQuran.fromJson(Map<String, dynamic> json) {
    surah_number = json['surah_number'];
    verse_number = json['verse_number'];
    text = json['text'];
    translation = json['translation'];
  }
}
