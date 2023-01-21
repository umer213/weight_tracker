import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/controller/store_weight_controller.dart';

class UserWeightList extends GetWidget<StoreWeightController> {
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  get index => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Records"),
              centerTitle: true,
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

              _editRecord(
                  context, "${controller.userWeight[index].documentId}");
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 3,
              child: ListTile(
                leading: Text("${controller.userWeight[index].name}"),
                title: Text("${controller.userWeight[index].weight}"),
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

  _editRecord(BuildContext context, String id) {
    showBottomSheet(
        context: context,
        builder: ((context) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _nameFeild(),
                _weightFeild(),
                updateButton(context),
              ],
            ),
          );
        }));
  }

  Widget updateButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          controller.updateWeight(nameController.text, weightController.text,
              "${controller.userWeight[index].documentId}");
          Navigator.pop(context);
        },
        child: Text("Update"));
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
}
