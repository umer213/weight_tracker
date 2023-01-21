import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/screens/login.dart';

import 'binding/store_binding.dart';
import 'controller/auth_controler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(Auth()));

  //this line can also give us oflline data ability
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: StoreBinding(),
      home: LogIn(),
    );
  }
}
