import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/round_button.dart';
import 'package:cab_connect/view/login/document_upload_view.dart';
import 'package:flutter/material.dart';

import 'line_text_field.dart';

class BankDetailView extends StatefulWidget {
  const BankDetailView({super.key});

  @override
  State<BankDetailView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<BankDetailView> {
  TextEditingController txtBankName = TextEditingController();
  TextEditingController txtAccoutHolderName = TextEditingController();
  TextEditingController txtAccoutNumber = TextEditingController();
  TextEditingController txtSwiftCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
          title: Text(
            'Bank Details',
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 25,
                fontWeight: FontWeight.w800),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              context.pop();
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Bank Name",
                  hintText: "Ex: HDFC",
                  controller: txtBankName,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Accout Holder Name",
                  hintText: "Ex: Neeraj Mehta",
                  controller: txtAccoutHolderName,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Accout Number",
                  hintText: "Ex: 3747-48XX-XXXX",
                  controller: txtAccoutNumber,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Swift/IFSC Code",
                  hintText: "KKBOX123",
                  obscureText: true,
                  controller: txtSwiftCode,
                  right: IconButton(
                    onPressed: () {},
                    icon: Image.asset("assets/img/password_show.png",
                        width: 25, height: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "By continuing, I confirm that i have read & agree to the",
                    style: TextStyle(color: TColor.primaryText, fontSize: 12),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terms & conditions",
                    style: TextStyle(color: TColor.primaryText, fontSize: 11),
                  ),
                  Text(
                    " and ",
                    style: TextStyle(color: TColor.secondaryText, fontSize: 11),
                  ),
                  Text(
                    "Privacy policy",
                    style: TextStyle(color: TColor.primaryText, fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 3),
                child: RoundButton(
                    title: "NEXT",
                    onPressed: () {
                      context.push(const DocumentDetailView(
                        title: "Personal Document",
                      ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
