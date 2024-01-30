import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/view/welcome_view.dart';
import 'package:flutter/material.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  List listArr = ["Arabic", "Chinese", "English", "Korean", "Hindi"];

  int selectChange = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          context.pop();
        },
      )),
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose language",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 28,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: listArr.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            selectChange = index;
                          });
                          context.push(const WelcomeView());
                        },
                        title: Text(
                          listArr[index],
                          style: TextStyle(
                            color: index == selectChange
                                ? TColor.primary
                                : TColor.primaryText,
                            fontSize: 18,
                          ),
                        ),
                        trailing: index == selectChange
                            ? Image.asset("assets/img/check_tick.png")
                            : null,
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
