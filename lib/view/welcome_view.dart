import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/round_button.dart';
import 'package:cab_connect/view/login/mobile_number_view.dart';
import 'package:flutter/material.dart';

import 'login/sign_in_view.dart';
import 'login/sign_up_view.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _SplashViewState();
}

class _SplashViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.bg,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/welcome_bg.png",
            width: context.width,
            height: context.height,
            fit: BoxFit.cover,
          ),
          Container(
            width: context.width,
            height: context.height,
            color: Colors.black.withOpacity(.8),
          ),
          SafeArea(
              child: Column(
            children: [
              Image.asset(
                "assets/img/app_logo.png",
                width: context.width * 0.7,
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                child: RoundButton(
                    title: "Get Start",
                    onPressed: () {
                      context.push(const MobileNumberView ());
                    }),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              //   child: RoundButton(
              //       title: "SIGN UP",
              //       onPressed: () {
              //         context.push(const SignUpView());
              //       }),
              // ),
            ],
          ))
        ],
      ),
    );
  }
}
