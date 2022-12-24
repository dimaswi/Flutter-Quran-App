import 'package:flutter/widgets.dart';

class ModelPaduan {
  int? id;
  String? name;

  ModelPaduan(this.id, this.name);

  ModelPaduan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
