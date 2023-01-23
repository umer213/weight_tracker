import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/controller/store_weight_controller.dart';
import 'package:weight_tracker/widgets/app_bar.dart';
import 'package:weight_tracker/widgets/text.dart';

class UserWeightList extends GetWidget<StoreWeightController> {
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  var dateFormat = {
    1: "jan",
    2: "jan",
    3: "jan",
    4: "jan",
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: MyAppBar(
                text: "Records",
                autoImp: true,
              ),
            ),
            backgroundColor: Colors.black87,
            body: Obx(
              () => _buildBuilder(),
            )));
  }

  Widget _buildBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.userWeight.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              nameController.text = "${controller.userWeight[index].name}";
              weightController.text = "${controller.userWeight[index].weight}";
              showAlertDialog(
                  context, "${controller.userWeight[index].documentId}");
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 3,
              child: ListTile(
                leading: AppNormalText(
                  text: "${controller.userWeight[index].name}",
                  color: Colors.black,
                ),
                title: AppLargeText(
                  text: "${controller.userWeight[index].weight}",
                  color: Colors.purple,
                ),
                subtitle: AppNormalText(
                  text: "${controller.userWeight[index].dateTime!.toDate()}",
                  size: 13,
                  color: Colors.green,
                ),
                trailing: deleteRcord(controller.userWeight[index].documentId!),
              ),
            ),
          );
        });
  }

  Widget deleteRcord(String id) {
    return CircleAvatar(
      child: InkWell(
          onTap: () {
            controller.deleteRecord(id);
          },
          child: Icon(Icons.delete)),
    );
  }

  showAlertDialog(BuildContext context, String id) {
    Widget UpdateButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        controller.updateWeight(nameController.text, weightController.text, id);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Update"),
      content: Container(
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: weightController,
            ),
          ],
        ),
      ),
      actions: [UpdateButton],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
