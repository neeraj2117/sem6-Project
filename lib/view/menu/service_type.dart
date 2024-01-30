import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/switch_row.dart';
import 'package:flutter/material.dart';

class ServiceTypeView extends StatefulWidget {
  const ServiceTypeView({super.key});

  @override
  State<ServiceTypeView> createState() => _ServiceTypeViewState();
}

class _ServiceTypeViewState extends State<ServiceTypeView> {
  List listArr = [
    {"name": "Exclusive", "detail": "What is executive?", "value": false},
    {"name": "Limo", "detail": "What is limo?", "value": true},
    {
      "name": "Economy",
      "detail": "Describe short brief to understand",
      "value": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: Image.asset("assets/img/back.png", width: 25, height: 25),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Switch service type',
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w700,
              color: TColor.primaryText),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: listArr.length,
        itemBuilder: (context, index) {
          return SwitchRow(
            sObj: listArr[index] as Map? ?? {},
            didChange: (isNew) {},
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: TColor.lightGray,
        ),
      ),
    );
  }
}
