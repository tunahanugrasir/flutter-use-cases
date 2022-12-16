import 'package:flutter/material.dart';

import '../filter_view.dart';

enum ColorEnum {
  red(Colors.red),
  green(Colors.green),
  blue(Colors.blue);

  final Color uniqueName;
  const ColorEnum(this.uniqueName);
}

class ColorModels extends IFilter {
  final ColorEnum color;

  ColorModels(this.color);

  @override
  int get id => color.index;

  @override
  String get key => color.name;
}
