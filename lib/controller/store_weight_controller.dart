import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/user_weight_model.dart';

class StoreWeightController extends GetxController {
  static StoreWeightController instance = Get.find();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference _collectionReference;

  RxList<UserWeightModel> userWeight = RxList<UserWeightModel>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // StoreWeightController.instance;
    _collectionReference = firebaseFirestore.collection("userData");
    userWeight.bindStream(listUserWight());
  }

  void saveUserWeight(
    String name,
    String weight,
    String documentId,
  ) async {
    try {
      await _collectionReference.add({
        "name": name,
        "weight": weight,
        "time": FieldValue.serverTimestamp(),
      });
      Get.snackbar("Sucesss", "The Weight was Stored");
    } catch (e) {
      Get.snackbar("Something went wrong", e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }

  Future updateWeight(String name, String weight, String doucumentId) async {
    try {
      await _collectionReference
          .doc(doucumentId)
          .update({"name": name, "weight": weight});

      Get.snackbar("Sucesss", "The record was updated");
    } catch (e) {
      Get.snackbar("Something went wrong", e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }

  void deleteRecord(String id) async {
    try {
      await _collectionReference.doc(id).delete();
      Get.snackbar("Sucesss", "This entry was deleted");
    } catch (e) {
      Get.snackbar("Something went wrong", e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }

  Stream<List<UserWeightModel>> listUserWight() => _collectionReference
      // .orderBy("dateTime", descending: true)
      .snapshots()
      .map((event) =>
          event.docs.map((e) => UserWeightModel.fromMap(e)).toList());
}
