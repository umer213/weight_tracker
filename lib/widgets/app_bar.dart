import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String text;
  final bool autoImp;

  const MyAppBar({super.key, required this.text, required this.autoImp});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.purple,
      title: Text(text),
      centerTitle: true,
      automaticallyImplyLeading: autoImp,
    );
  }
}
