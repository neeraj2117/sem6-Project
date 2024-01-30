import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/round_button.dart';
import 'package:flutter/material.dart';

class ReasonView extends StatefulWidget {
  const ReasonView({super.key});

  @override
  State<ReasonView> createState() => _ReasonViewState();
}

class _ReasonViewState extends State<ReasonView> {
  List reasonArr = [
    "Rider is'nt here",
    "Wrong address shown",
    "Don't charge rider",
    "Don't charge rider",
    "Don't charge rider"
  ];

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        backgroundColor: const Color.fromARGB(255, 185, 237, 243),
        leading: IconButton(
          icon: Image.asset("assets/img/close.png", width: 25, height: 25),
          onPressed: () {
            context.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          'Cancel Trip',
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: TColor.primaryText),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: TColor.placeholder,
                indent: 80,
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: reasonArr.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: IconButton(
                    onPressed: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    icon: Image.asset(
                        selectIndex == index
                            ? "assets/img/check_list.png"
                            : "assets/img/uncheck_list.png",
                        width: 20,
                        height: 20),
                  ),
                  title: Text(
                    reasonArr[index] as String? ?? "",
                    style: TextStyle(
                      color: selectIndex == index
                          ? TColor.primaryText
                          : TColor.secondaryText,
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RoundButton(
                title: "DONE",
                onPressed: () {
                  context.pop();
                }),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
