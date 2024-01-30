import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/common_extension.dart';
import 'package:cab_connect/common/round_button.dart';
import 'package:cab_connect/cubit/login_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../common/globs.dart';
import '../../common/service_call.dart';

class OTPView extends StatefulWidget {
  final String number;
  final String code;

  const OTPView({super.key, required this.number, required this.code});

  @override
  State<OTPView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<OTPView> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String vId = "";
  var otpCode = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    onSendSms();
  }

  onSendSms() async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "${widget.code} ${widget.number}",
        timeout: const Duration(seconds: 5),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (error) {
          mdShowAlert("Fail", error.toString(), () {});
        },
        codeSent: (verificationId, forceResendingToken) {
          vId = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          vId = verificationId;
        },
      );
    } catch (e) {
      mdShowAlert("Fail", e.toString(), () {});
    }
  }

  void smsVerification() async {
    if (otpCode.length < 6) {
      mdShowAlert("Error", "Please enter valid code", () {});
      return;
    }

    try {
      final AuthCredential credential =
          PhoneAuthProvider.credential(verificationId: vId, smsCode: otpCode);

      final User? user = (await auth.signInWithCredential(credential)).user;

      if (user != null) {
        mdShowAlert(
            "Success", "Successfully signed in UID : ${user.uid}", () {});
        submitApiData(user.uid);
      } else {
        mdShowAlert("Fail", "invalid otp", () {});
      }
    } catch (e) {
      mdShowAlert("Fail", e.toString(), () {});
    }
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
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: LoginState implement listener

          if (state is LoginHUDState) {
            Globs.showHUD();
          } else if (state is LoginApiResultState) {
            Globs.hideHUD();

            mdShowAlert(
                "Success", "Successfully signed in api calling done", () {});

            // if (ServiceCall.userType == 1) {
            //   context.push(const UserHomeView());
            // } else {
            //   if (ServiceCall.userObj[KKey.status] == 1) {
            //     context.push(const HomeView());
            //   } else {
            //     context.push(const ProfileImageView());
            //   }
            // }
          } else if (state is LoginErrorState) {
            Globs.hideHUD();
            mdShowAlert("Fail", state.errorMSG, () {});
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OTP Verification",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 31,
                      fontWeight: FontWeight.w800),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter the 6-digit code sent to you at",
                      style:
                          TextStyle(color: TColor.secondaryText, fontSize: 19),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.code} ${widget.number}",
                      style: TextStyle(color: TColor.primaryText, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "Edit",
                        style: TextStyle(color: TColor.secondary, fontSize: 16),
                      ),
                    )
                  ],
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: TColor.placeholder,
                  focusedBorderColor: TColor.primary,
                  textStyle: TextStyle(color: TColor.primaryText, fontSize: 16),
                  showFieldAsBox: false,
                  borderWidth: 4.0,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    otpCode = code;
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    otpCode = verificationCode;
                    smsVerification();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 3),
                  child: RoundButton(
                      title: "SUBMIT",
                      onPressed: () {
                        smsVerification();
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OtpTimerButton(
                      height: 60,
                      onPressed: () {
                        onSendSms();
                      },
                      text: const Text(
                        'Resend OTP',
                        style: TextStyle(fontSize: 16),
                      ),
                      buttonType: ButtonType.text_button,
                      backgroundColor: TColor.primaryText,
                      duration: 60,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void submitApiData(String uid) {
    context.read<LoginCubit>().submitLogin(widget.code, widget.number, "1");
  }
}
