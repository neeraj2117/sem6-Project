import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/round_button.dart';
import 'package:cab_connect/view/login/bank_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import 'line_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<SignUpView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  TextEditingController txtMobile = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtHomeAddress = TextEditingController();

  late CountryCode countryCode;
  TextEditingController txtPassqword = TextEditingController();

  @override
  void initState() {
    super.initState();

    countryCode = countryCodePicker.countryCodes
        .firstWhere((element) => element.name == "India");
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Profile",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 28,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "First Name",
                  hintText: "Ex: Neeraj",
                  controller: txtFirstName,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Last Name",
                  hintText: "Ex: Mehta",
                  controller: txtLastName,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Home Address",
                  hintText: "Ex: NYC Time Square 403",
                  controller: txtHomeAddress,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Mobile Number",
                style: TextStyle(color: TColor.placeholder, fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () async {
                      final code =
                          await countryCodePicker.showPicker(context: context);
                      if (code != null) {
                        countryCode = code;
                        setState(() {});
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 20,
                          child: countryCode.flagImage(),
                        ),
                        Text(
                          "   ${countryCode.dialCode} ",
                          style: TextStyle(
                              color: TColor.primaryText, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: txtMobile,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "771594XXXX"),
                    ),
                  )
                ],
              ),
              // const Padding(
              //   padding: EdgeInsets.only(right: 20.0),
              //   child: Divider(),
              // ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Password",
                  hintText: "******",
                  obscureText: true,
                  controller: txtPassqword,
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
                    title: "REGISTER",
                    onPressed: () {
                      context.push(const BankDetailView());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
