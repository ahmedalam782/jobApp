import 'package:flutter/material.dart';

class TextSpanComponents extends StatelessWidget {
  final String? textOne;
  final String? textColored;
  final String? textThree;
  final TextStyle? styleTextOne;
  final TextStyle? styleTextColored;
  final TextStyle? styleTextThree;

  const TextSpanComponents({
    super.key,
    this.textOne,
    this.textColored,
    this.textThree,
    this.styleTextOne,
    this.styleTextColored,
    this.styleTextThree,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: textOne,
        style: styleTextOne,
        children: [
          TextSpan(text: textColored, style: styleTextColored),
          TextSpan(
            text: textThree,
            style: styleTextThree,
          ),
        ],
      ),
    );
  }
}
