import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/controller/auth_controler.dart';
import 'package:weight_tracker/screens/login.dart';
import 'package:weight_tracker/widgets/text.dart';

import '../widgets/app_bar.dart';

class SignUp extends GetWidget<Auth> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(
            text: "Sign Up ",
            autoImp: false,
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color.fromARGB(255, 193, 80, 213), Colors.blue],
            )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: SingleChildScrollView(child: _myColumn()),
          ),
        ],
      ),
    ));
  }

  Widget _myColumn() {
    return Column(
      children: [
        welcome_Feild(),
        nameFeild(),
        emailFeild(),
        passwordFeild(),
        loginButton(),
        goToLogin(),
      ],
    );
  }

  Widget nameFeild() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(13)),
      child: TextField(
        controller: _nameController,
        decoration: InputDecoration(
            hintText: 'Name',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }

  Widget emailFeild() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(13)),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }

  Widget passwordFeild() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 13),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(13)),
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: _passwordController,
        decoration: InputDecoration(
            hintText: 'password',
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () async {
        Auth.instance
          ..createUser(_nameController.text, _emailController.text,
              _passwordController.text);
      },
      child: AppNormalText(text: "Signup"),
    );
  }

  Widget goToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppNormalText(text: "Already have account ?"),
        TextButton(
            onPressed: () {
              Get.off(LogIn());
            },
            child: AppNormalText(
              text: "LogIn",
              color: Colors.black,
            ))
      ],
    );
  }

  Widget welcome_Feild() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: AppRichText(
        text1: "Wel ",
        color1: Colors.white,
        text2: 'Come',
        color2: Colors.green,
      ),
    );
  }
}

// TextFormField _textFormFeild(
//     String label, String hint, TextEditingController textEditingController) {
//   return TextFormField(
//     decoration: InputDecoration(
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
//   );
// }
