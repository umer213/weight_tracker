import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weight_tracker/controller/auth_controler.dart';
import 'package:weight_tracker/controller/store_weight_controller.dart';
import 'package:weight_tracker/screens/get_weight.dart';

import '../widgets/app_bar.dart';

class StoreWeightScreen extends GetWidget<StoreWeightController> {
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    weightController.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: MyAppBar(
              text: "HomePage",
              autoImp: false,
            )),
        floatingActionButton: floatButton(),
        body: Stack(
          children: [
            Positioned(
              top: 100,
              left: 150,
              child: Container(
                child: Lottie.asset(
                  "assets/balance.json",
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: _weightColumn(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _weightColumn() {
    return Column(
      children: [_nameFeild(), _weightFeild(), storeButton(), tostoredPage()],
    );
  }

  Widget _nameFeild() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
            label: Text("Name"),
            hintText: "Enter your name",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  Widget _weightFeild() {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: weightController,
        decoration: InputDecoration(
            label: Text("weight"),
            hintText: "Enter your weight",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  Widget storeButton() {
    return ElevatedButton(
        onPressed: () {
          // StoreWeightController.instance
          //     .saveUserWeight(nameController.text, weightController.text);
          controller.saveUserWeight(
            nameController.text,
            weightController.text,
            "",
          );
          _clearText();
        },
        child: Text("Store"));
  }

  Widget tostoredPage() {
    return ElevatedButton(
        onPressed: () {
          Get.to(UserWeightList());
        },
        child: Text("StoredData"));
  }

  void _clearText() {
    nameController.clear();
    weightController.clear();
  }

  Widget floatButton() {
    return Container(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () {
          Auth.instance.singOut();
        },
        child: Text(
          "signOut",
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
