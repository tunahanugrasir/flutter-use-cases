import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

mixin ShowSheetMixin {
  static Future<T?> showCustomBottomSheet<T>({required BuildContext context, required Widget child}) {
    return showModalBottomSheet<T>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: context.normalRadius)),
      context: context,
      builder: (context) {
        return Column(
          children: [
            Row(
              children: [
                const Divider(),
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            Expanded(child: child)
          ],
        );
      },
    );
  }
}
