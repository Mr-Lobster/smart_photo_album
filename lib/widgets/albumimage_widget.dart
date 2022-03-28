import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/providers/single_provider.dart';

//图库里面的照片

class Albumimageitem extends StatefulWidget {
  Albumimageitem({Key? key, required this.Img_index}) : super(key: key);
  late int Img_index;

  @override
  State<Albumimageitem> createState() => _AlbumimageitemState();
}

class _AlbumimageitemState extends State<Albumimageitem> {
  late Uint8List thumData;

  @override
  Widget build(BuildContext context) {
    thumData = context.read<SingleProvider>().thumData[widget.Img_index];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.red,
                leading: const BackButton(),
                title: Text(
                  "图片展示",
                ),
              ),
              body: Center(
                child: AspectRatio(
                    aspectRatio: 1,
                    child: Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.memory(
                          thumData,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))),
              ),
            ); //返回的是需要跳转单页面
          },
        ));
      },
      child: AspectRatio(
          aspectRatio: 1,
          child: Expanded(
              child: Padding(
            padding: const EdgeInsets.all(1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.memory(
                thumData,
                fit: BoxFit.cover,
              ),
            ),
          ))),
    );
  }
}
