class ModelNamaSurat {
  int? number;
  String? name;
  String? transliteration_en;
  String? translation_en;
  int? total_verses;
  String? revelation_type;

  ModelNamaSurat(this.number, this.name, this.transliteration_en,
      this.translation_en, this.total_verses, this.revelation_type);

  ModelNamaSurat.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    transliteration_en = json['transliteration_en'];
    translation_en = json['translation_en'];
    total_verses = json['total_verses'];
    revelation_type = json['revelation_type'];
  }
}
