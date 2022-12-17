import 'package:flutter/material.dart';

class EmptyElevatedButtonStyle extends ButtonStyle {
  EmptyElevatedButtonStyle()
      : super(
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.all(0),
        );
}
