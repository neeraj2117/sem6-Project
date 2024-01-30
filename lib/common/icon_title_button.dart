import 'package:flutter/material.dart';

import 'color_extension.dart';

class IconTitleButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const IconTitleButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 45,
              height: 45,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: TColor.primaryText),
            ),
          ],
        ));
  }
}
