import 'package:cab_connect/common/color_extension.dart';
import 'package:cab_connect/common/round_button.dart';
import 'package:cab_connect/view/login/document_upload_view.dart';
import 'package:cab_connect/view/login/vehicle_document_view.dart';
import 'package:flutter/material.dart';

import 'line_text_field.dart';

class AddVehicleView extends StatefulWidget {
  const AddVehicleView({super.key});

  @override
  State<AddVehicleView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<AddVehicleView> {
  TextEditingController txtServiceType = TextEditingController();
  TextEditingController txtBrandName = TextEditingController();
  TextEditingController txtModelName = TextEditingController();
  TextEditingController txtManufacturer = TextEditingController();
  TextEditingController txtNumberPlate = TextEditingController();
  TextEditingController txtColor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
          title: Text(
            'Add Vehicle',
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
                  title: "Service Type",
                  hintText: "Ex: type",
                  controller: txtServiceType,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Brand (Auto Suggestions)",
                  hintText: "Ex: BMW",
                  controller: txtBrandName,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Model (Auto Suggestions)",
                  hintText: "Ex: ABC",
                  controller: txtModelName,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Manufacturer (Auto Suggestions)",
                  hintText: "Ex: BMW",
                  obscureText: true,
                  controller: txtManufacturer,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Number plate",
                  hintText: "Ex: MH0767",
                  obscureText: true,
                  controller: txtNumberPlate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: LineTextField(
                  title: "Color",
                  hintText: "Ex: Red",
                  obscureText: true,
                  controller: txtColor,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 3),
                child: RoundButton(
                    title: "REGISTER",
                    onPressed: () {
                      context.push(const VehicleDocumentUploadView());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
