import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  const AppLargeText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.size = 22,
      this.fontWeight = FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}

class AppNormalText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  const AppNormalText(
      {super.key,
      required this.text,
      this.color = Colors.white,
      this.size = 17,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}

class AppRichText extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color1;
  final Color color2;
  final double size;
  final FontWeight fontWeight;
  const AppRichText(
      {super.key,
      required this.text1,
      required this.color1,
      this.size = 22,
      this.fontWeight = FontWeight.bold,
      required this.text2,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: TextStyle(
          color: color1,
          fontSize: size,
          fontWeight: fontWeight,
        ),
        children: <TextSpan>[
          TextSpan(
              text: text2,
              style: TextStyle(
                  color: color2, fontSize: size, fontWeight: fontWeight)),
        ],
      ),
    );
  }
}
