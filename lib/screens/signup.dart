import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weight_tracker/controller/auth_controler.dart';

class SignUp extends GetWidget<Auth> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: SingleChildScrollView(child: _myColumn()),
      ),
    ));
  }

  Widget _myColumn() {
    return Column(
      children: [
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
          border: Border.all(color: Colors.purple),
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
            hintText: 'password',
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
      child: Text('LogIn'),
    );
  }

  Widget goToLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have account ?"),
        TextButton(
          onPressed: () {
            Get.off(SignUp());
          },
          child: Text('Log in'),
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
