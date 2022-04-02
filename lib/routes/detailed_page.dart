import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';

class DetailedPage extends StatefulWidget {
  DetailedPage({Key? key, required this.albumIndex, required this.imgIndex})
      : super(key: key);
  int albumIndex;
  int imgIndex = 0;

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  bool isLoading = true;
  bool isImg = true;
  late Uint8List originBytes;

  void initData() async {
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
    final List<AssetEntity> entities = await paths[widget.albumIndex]
        .getAssetListRange(start: widget.imgIndex, end: widget.imgIndex + 1);
    int type = entities[0].typeInt;
    if (type != 1) {
      setState(() {
        isImg = false;
        isLoading = false;
      });
      return;
    }
    var temp = await entities[0].originBytes;
    originBytes = temp!;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.red,
        leading: const BackButton(),
        title: const Text(
          "查看详情 ",
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : isImg
                ? AspectRatio(
                    aspectRatio: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.memory(
                          originBytes,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
                : const Text("抱歉目前本应用仅支持展示普通图片"),
      ),
    );
  }
}
