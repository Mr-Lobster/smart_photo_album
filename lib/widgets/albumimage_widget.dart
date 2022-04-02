import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/providers/single_provider.dart';
import 'package:smart_photo_album/routes/detailed_page.dart';
//图库里面的照片

class Albumimageitem extends StatefulWidget {
  Albumimageitem({Key? key, required this.albumIndex, required this.imgIndex})
      : super(key: key);
  int imgIndex;
  int albumIndex;

  @override
  State<Albumimageitem> createState() => _AlbumimageitemState();
}

class _AlbumimageitemState extends State<Albumimageitem> {
  late Uint8List thumData;

  @override
  Widget build(BuildContext context) {
    thumData = context.watch<SingleProvider>().thumData[widget.imgIndex];

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DetailedPage(
              albumIndex: widget.albumIndex,
              imgIndex: widget.imgIndex,
            ); //返回的是需要跳转单页面
          },
        ));
      },
      child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.memory(
                thumData,
                fit: BoxFit.cover,
              ),
            ),
          )),
    );
  }
}
