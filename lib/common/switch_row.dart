import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color_extension.dart';

class SwitchRow extends StatelessWidget {
  final Map sObj;
  final Function(bool) didChange;

  const SwitchRow({super.key, required this.sObj, required this.didChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColor.lightWhite.withOpacity(.4),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sObj["name"] as String? ?? "",
                  style: TextStyle(
                    fontSize: 16,
                    color: TColor.primaryText,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  sObj["detail"] as String? ?? "",
                  style: TextStyle(
                    fontSize: 15,
                    color: TColor.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          CupertinoSwitch(
              value: sObj["value"] as bool? ?? false, onChanged: didChange)
        ],
      ),
    );
  }
}
