import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/round_button.dart';
import 'package:cab_connect/view/login/subscription_view.dart';
import 'package:flutter/material.dart';
import '../../common/document_row.dart';

class VehicleDocumentUploadView extends StatefulWidget {
  const VehicleDocumentUploadView({super.key});

  @override
  State<VehicleDocumentUploadView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<VehicleDocumentUploadView> {
  List documentList = [
    {
      "name": "RC Book",
      "detail": "Vehicle Registration",
      "info": "",
      "status": DocumentStatus.uploaded
    },
    {
      "name": "Insurance policy",
      "detail": "A driving license is an official do...",
      "info": "",
      "status": DocumentStatus.uploading
    },
    {
      "name": "Owner certificate",
      "detail": "A passport is a travel document...",
      "info": "",
      "status": DocumentStatus.upload
    },
    {
      "name": "PUC",
      "detail": "Incorrect document type",
      "info": "",
      "status": DocumentStatus.upload
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
          title: Text(
            "Vehicle Document",
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
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var dObj = documentList[index] as Map? ?? {};
                    return DocumentRow(
                        dObj: dObj,
                        onPressed: () {},
                        onInfo: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Container(
                                  width: context.width,
                                  height: context.height - 100,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 46, horizontal: 20),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 3),
                                      ]),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "RC Book",
                                          style: TextStyle(
                                              color: TColor.primaryText,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Text(
                                              "Certainly! Here is a Lorem Ipsum passage consisting of 150 words: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nec diam eu diam accumsan lacinia. Integer congue faucibus diam, eget ultrices turpis ullamcorper eu. Quisque porttitor turpis sit amet libero laoreet, ac tincidunt metus facilisis.\n\n Nulla facilisi. Vivamus vel mi nec nisi scelerisque iaculis. Fusce vitae mi in arcu aliquam pharetra. Etiam nec mi vel velit fermentum rhoncus. Curabitur nec urna eget elit consequat dignissim. \n\n In hac habitasse platea dictumst. Integer in erat eu metus gravida vehicula. Duis ac convallis urna. Curabitur a purus at sapien tincidunt convallis. Integer aliquet, urna eget congue eleifend, elit arcu fringilla arcu, ac tincidunt velit purus id metus. Suspendisse ut risus vel nisi venenatis consectetur. Sed quis mauris at justo vestibulum fermentum eget id nulla. \n\n In hac habitasse platea dictumst. Integer in erat eu metus gravida vehicula. Duis ac convallis urna. Curabitur a purus at sapien tincidunt convallis. Integer aliquet, urna eget congue eleifend, elit arcu fringilla arcu, ac tincidunt velit purus id metus. Suspendisse ut risus vel nisi venenatis consectetur. Sed quis mauris at justo vestibulum fermentum eget id nulla \n\n In hac habitasse platea dictumst. Integer in erat eu metus gravida vehicula. Duis ac convallis urna. Curabitur a purus at sapien tincidunt convallis. Integer aliquet, urna eget congue eleifend, elit arcu fringilla arcu, ac tincidunt velit purus id metus. Suspendisse ut risus vel nisi venenatis consectetur. Sed quis mauris at justo vestibulum fermentum eget id nulla",
                                              style: TextStyle(
                                                color: TColor.secondaryText,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                context.pop();
                                              },
                                              child: Text(
                                                "OKAY",
                                                style: TextStyle(
                                                    color: TColor.primary,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                );
                              });
                        },
                        onUpload: () {},
                        onAction: () {},
                        status: dObj["status"] as DocumentStatus? ??
                            DocumentStatus.upload);
                  },
                  itemCount: documentList.length),
              const SizedBox(
                height: 20,
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
                      context.push(const SubscriptionPlanView());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
