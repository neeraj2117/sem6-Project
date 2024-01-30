import 'package:flutter/material.dart';

import 'color_extension.dart';

class IconTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final VoidCallback onPressed;

  const IconTitleSubtitle(
      {super.key,
      required this.title,
      required this.subtitle,
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
              width: 20,
              height: 20,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: TColor.primaryText,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: TColor.primaryText,
              ),
            ),
          ],
        ));
  }
}
