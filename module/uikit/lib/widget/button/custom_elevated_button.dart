import 'package:flutter/material.dart';

import '../../utility/decorations/custom_elevated_button_decorations.dart';
import '../../utility/style/custom_elevated_button_style.dart';

enum CustomButtonSizes {
  small(30.0),
  medium(60.0),
  large(90.0);

  final double value;
  const CustomButtonSizes(this.value);
}

class CustomButton extends StatelessWidget {
  final ColorScheme? colorScheme;
  final VoidCallback? onPressed;
  final CustomButtonSizes size;
  final String title;
  const CustomButton({
    Key? key,
    this.onPressed,
    this.size = CustomButtonSizes.medium,
    required this.title,
    this.colorScheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: EmptyElevatedButtonStyle(),
      onPressed: onPressed,
      child: SizedBox(
        height: size.value,
        child: DecoratedBox(
          decoration: CustomBorderDecorations(colorScheme ?? Theme.of(context).colorScheme),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
