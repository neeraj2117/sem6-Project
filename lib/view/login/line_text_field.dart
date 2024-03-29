import 'package:cab_connect/common/color_extension.dart';
import 'package:flutter/material.dart';

class LineTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? right;

  const LineTextField(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.keyboardType,
      this.obscureText,
      this.right});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(color: TColor.placeholder, fontSize: 14),
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 16,
              fontWeight: FontWeight.w800),
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              suffixIcon: right,
              hintStyle: TextStyle(color: TColor.placeholder, fontSize: 16)),
        ),
        Container(
          color: Color.fromARGB(255, 194, 194, 194),
          height: 0.5,
          width: double.maxFinite,
        )
      ],
    );
  }
}
