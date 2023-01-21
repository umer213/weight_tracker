import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../screens/login.dart';
import '../screens/store_weight.dart';

class Auth extends GetxController {
  static Auth instance = Get.find();
  late Rx<User?> user;
  FirebaseAuth _auth = FirebaseAuth.instance;

  // we can also use list(collection of users)  to store
  //their own records of weight and many other things

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    user = Rx<User?>(_auth.currentUser);
    user.bindStream(_auth.userChanges());
    ever(user, firstScreen);
  }

  firstScreen(User? user) {
    if (user == null) {
      print("done");

      Get.offAll(LogIn());
    } else {
      Get.offAll(StoreWeightScreen());
    }
  }

  void createUser(String name, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar("welcome${email.toString()}", email.removeAllWhitespace,
          snackPosition: SnackPosition.TOP);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Something went wrong", e.toString(),
          snackPosition: SnackPosition.TOP);

      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
      } else if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}

      print(e.code);
    } catch (e) {
      print(e);
    }
  }

  void loginIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "welcome Back ${email.toString()}",
        email.removeAllWhitespace,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar("Something went wrong", e.toString(),
          snackPosition: SnackPosition.TOP);
    }
  }

  void singOut() async {
    await _auth.signOut();
  }
}
