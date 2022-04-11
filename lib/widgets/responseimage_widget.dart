import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';

class Responseimage extends StatelessWidget {
  Responseimage({Key? key, required this.thumData}) : super(key: key);
  Uint8List thumData;

  @override
  Widget build(BuildContext context) {
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
                title: const Text(
                  "查看详情 ",
                ),
              ),
              body: Center(
                child: PinchZoomImage(
                  image: Image.memory(
                    thumData,
                    fit: BoxFit.cover,
                  ),
                  zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
                ),
              ),
            );
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
