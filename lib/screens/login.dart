import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:rive/rive.dart';
import 'package:weight_tracker/controller/auth_controler.dart';
import 'package:weight_tracker/screens/signup.dart';
import 'package:weight_tracker/widgets/app_bar.dart';

import '../widgets/text.dart';

//did not use basic things like app bar
//did not focus on the ui beacuse i will learn rive and implement those animations later

class LogIn extends GetWidget<Auth> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppBar(
            text: "Log in",
            autoImp: false,
          )),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/blance.jpg"), fit: BoxFit.cover)),
            //will not show good ui with this image but can use good backgroud animation instead
            //of image will make it look better
          ),
          // RiveAnimation.asset("assets/log.riv",fit:BoxFit.cover),==>
          //this rive animation takes time to compile because my system is slow so i did not perform it further
          //u can run it with changing ndk version in build gradle
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
        // _textFormFeild("email", "enter your email", _emailController),
        // _textFormFeild("email", "enter your email", _passwordController),
        welcome_Feild(),
        emailFeild(),
        passwordFeild(),
        loginButton(),
        goToSignUp(),
      ],
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
        style: TextStyle(color: Colors.white),
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
        onPressed: () {
          Auth.instance
              .loginIn(_emailController.text, _passwordController.text);
        },
        child: AppNormalText(text: "Log in"));
  }

  Widget welcome_Feild() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: AppRichText(
        text1: "Welcome ",
        color1: Colors.white,
        text2: 'Back',
        color2: Colors.purple,
      ),
    );
  }

  Widget goToSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppNormalText(text: "Create an Account !"),
        TextButton(
            onPressed: () {
              Get.off(SignUp());
            },
            child: AppNormalText(
              text: "Sign up",
              color: Colors.purple,
              size: 20,
            ))
      ],
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
