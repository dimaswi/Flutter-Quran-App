import 'package:flutter/widgets.dart';

class ModelWudhu {
  int? id;
  String? name;

  ModelWudhu(this.id, this.name);

  ModelWudhu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
