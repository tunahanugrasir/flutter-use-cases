import 'package:flutter/material.dart';

import '../radius/custom_elevated_button_radius.dart';

class CustomBorderDecorations extends BoxDecoration {
  CustomBorderDecorations(ColorScheme colorScheme)
      : super(
          borderRadius: CustomBorderRadius.circular(),
          gradient: LinearGradient(
            colors: [
              colorScheme.onPrimary,
              colorScheme.onSecondary,
            ],
          ),
        );
}
