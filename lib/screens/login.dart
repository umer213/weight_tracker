import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/controller/auth_controler.dart';
import 'package:weight_tracker/screens/signup.dart';

class LogIn extends GetWidget<Auth> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          // Image.asset("assets/balance.jpg",fit: BoxFit.cover,),
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
          border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(13)),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
            hintText: 'Email',
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
          border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(13)),
      child: TextField(
        controller: _passwordController,
        decoration: InputDecoration(
            hintText: 'Email',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () {
        Auth.instance.loginIn(_emailController.text, _passwordController.text);
      },
      child: Text('LogIn'),
    );
  }

  Widget goToSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Create an account !"),
        TextButton(
          onPressed: () {
            Get.off(SignUp());
          },
          child: Text('sing up'),
        )
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