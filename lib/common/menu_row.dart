import 'package:flutter/material.dart';
import 'color_extension.dart';

class MenuRow extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;

  const MenuRow(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: TColor.lightWhite.withOpacity(.4),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 12,
            ),
            Image.asset(
              icon,
              width: 30,
              height: 30,
              color: TColor.secondaryText,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  color: TColor.primaryText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
