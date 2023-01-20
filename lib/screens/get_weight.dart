import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/controller/store_weight_controller.dart';

class UserWeightList extends GetWidget<StoreWeightController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Obx(
      () => _buildBuilder(),
    )));
  }

  Widget _buildBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.userWeight.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            child: ListTile(
              leading: Text("${controller.userWeight[index].name}"),
              title: Text("${controller.userWeight[index].weight}"),
              trailing: deleteRcord(),
            ),
          );
        });
  }

  Widget deleteRcord() {
    return CircleAvatar(
      child: InkWell(
          onTap: () {
            controller.delete();
          },
          child: Icon(Icons.delete)),
    );
  }
}
