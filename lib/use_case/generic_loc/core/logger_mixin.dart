// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'project_logger.dart';

mixin Logger<T extends StatefulWidget> on State<T> {
  PageSpecialKeys get key;
  CustomModel get model;
  @override
  void initState() {
    super.initState();
    ProjectLoggerLazy().logClassName(this);
    ProjectLoggerLazy().logPageName(key);
    ProjectLoggerLazy().logCustomModel(model);
  }
}

enum PageSpecialKeys { home, detail }

class CustomModel {
  String? id;
  String? description;
  CustomModel({this.id, this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
    };
  }

  factory CustomModel.fromMap(Map<String, dynamic> map) {
    return CustomModel(
      id: map['id'] != null ? map['id'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomModel.fromJson(String source) => CustomModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
