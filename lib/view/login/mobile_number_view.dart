import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/round_button.dart';
import 'package:cab_connect/view/login/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class MobileNumberView extends StatefulWidget {
  const MobileNumberView({super.key});

  @override
  State<MobileNumberView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<MobileNumberView> {
  FlCountryCodePicker countryCodePicker = const FlCountryCodePicker();
  TextEditingController txtMobile = TextEditingController();
  late CountryCode countryCode;

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
      body: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter mobile number",
              style: TextStyle(
                  color: TColor.primaryText,
                  fontSize: 28,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 15,
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
                        style:
                            TextStyle(color: TColor.primaryText, fontSize: 16),
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
                        hintText: "7715949586"),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Divider(),
            ),
            const SizedBox(
              height: 10,
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 3),
              child: RoundButton(
                  title: "CONTINUE",
                  onPressed: () {
                    context.push(OTPView(
                      code: countryCode.dialCode,
                      number: txtMobile.text,
                    ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
