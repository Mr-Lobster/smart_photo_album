import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/album_provider.dart';

class Imageitem extends StatelessWidget {
  Imageitem({Key? key, this.index = 0}) : super(key: key);
  int index = 0;

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
              context.watch<AlbumProvider>().thumData[index],
              fit: BoxFit.cover,
            ),
          ),
        )));
  }
}
