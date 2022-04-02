import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/widgets/imageitem_widget.dart';
import '../providers/album_provider.dart';
import '../widgets/albumimage_widget.dart';

class AlbumContentPage extends StatefulWidget {
  AlbumContentPage({Key? key, required this.albumIndex}) : super(key: key);
  int albumIndex = 0; //当前图集的编号

  @override
  State<AlbumContentPage> createState() => _AlbumContentPageState();
}

class _AlbumContentPageState extends State<AlbumContentPage> {
  bool isLoading = true;
  late AssetPathEntity Albumasset; //当前图集
  //late List<AssetEntity> entities; //当前图集的照片
  late int albumLength; //照片的长度
  late List<Uint8List> _thumData;
  int currentlen = 0; //当前已加载图片长度

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.albumIndex = 0;
    _initLoad();
    return Center(
        child: Scaffold(
      appBar: AppBar(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.red,
        leading: const BackButton(),
        title: Text("当前图集: " +
            context
                .read<AlbumProvider>()
                .getNameOfAlbum(widget.albumIndex)
                .toString()),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Albumimageitem(
              albumIndex: 0,
              imgIndex: 0,
            ),
    ));
  }

  // void _initLoad(BuildContext context) async {
  //   Fluttertoast.showToast(
  //     msg: "开始加载数据",
  //   );
  //   Albumasset = context.read<AlbumProvider>().getAlbum(widget.albumIndex);
  //   albumLength = Albumasset.assetCount;
  //   List<AssetEntity> entities =
  //       await Albumasset.getAssetListRange(start: 0, end: 1);
  //   for (int j = 0; j < 1; j++) {
  //     Uint8List? temp = await entities[j].thumbData;
  //     _thumData.add(temp!);
  //   }
  //   Fluttertoast.showToast(
  //     msg: "数据记载完毕",
  //   );
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  void _initLoad() async {
    _thumData = [];

    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList();
    Albumasset = paths[widget.albumIndex];
    albumLength = Albumasset.assetCount;

    final List<AssetEntity> entities =
        await Albumasset.getAssetListRange(start: 0, end: 5);

    for (int i = 0; i < 5; i++) {
      Uint8List? temp = await entities[0].thumbData;
      _thumData.add(temp!);
    }

    setState(() {
      isLoading = false;
    });
  }

// void _retrieveData() async {
//   for (int j = 1; j <= 19; j++) {
//     Uint8List? temp = await entities[currentlen++].thumbData;
//     _thumData.add(temp!);
//   }
//   Uint8List? temp = await entities[currentlen++].thumbData;
//   setState(() {
//     _thumData.add(temp!);
//   });
// }
}
