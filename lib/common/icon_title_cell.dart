import 'package:flutter/material.dart';

import 'color_extension.dart';

class IconTitleCell extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;
  final double width;

  const IconTitleCell({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.width = 50,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: width,
            height: 50,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextStyle(
              color: TColor.primaryTextW,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
