import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 0.05 * width, top: 0.14 * height),
      child: const Text(
        "Explore",
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 60,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
