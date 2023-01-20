import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

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
    _collectionReference = firebaseFirestore.collection("userData");
    userWeight.bindStream(listUserWight());
  }

  void saveUserWeight(String name, String weight) async {
    try {
      await _collectionReference.add({"name": name, "weight": weight});
      Get.snackbar("Sucesss", "The Weight was Stored");
    } catch (e) {
      Get.snackbar("Something went wrong", e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }

  void delete() async {
    try {
      await _collectionReference.doc().delete();
      Get.snackbar("Sucesss", "This entry was deleted");
    } catch (e) {
      Get.snackbar("Something went wrong", e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }

  Stream<List<UserWeightModel>> listUserWight() =>
      _collectionReference.snapshots().map((event) =>
          event.docs.map((e) => UserWeightModel.fromMap(e)).toList());
}
