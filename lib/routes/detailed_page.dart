import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/single_provider.dart';

class DetailedPage extends StatefulWidget {
  DetailedPage({Key? key, required this.Image_Index}) : super(key: key);
  int Image_Index = 0;

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  bool isLoading = true;
  late Uint8List originBytes;

  void initData(BuildContext context) async {
    var res =
        await context.read<SingleProvider>().getOriginBytes(widget.Image_Index);
    originBytes = res;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    initData(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.red,
        leading: const BackButton(),
        title: const Text(
          "图片展示",
        ),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : AspectRatio(
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
                )),
      ),
    );
  }
}
