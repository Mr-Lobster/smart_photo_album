import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/album_provider.dart';

class Imageitem extends StatelessWidget {
  const Imageitem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Expanded(
            child: Padding(
          padding: const EdgeInsets.all(1),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.memory(
              context.watch<album_provider>().thumData,
              fit: BoxFit.cover,
            ),
          ),
        )));
  }
}
