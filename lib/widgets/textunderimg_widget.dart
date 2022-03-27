import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/album_provider.dart';

class Textunderimg extends StatelessWidget {
  Textunderimg({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        ),
        flex: 1);
  }
}
