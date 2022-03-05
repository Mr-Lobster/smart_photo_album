import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';

class AlbumWidget extends StatefulWidget {
  const AlbumWidget({Key? key}) : super(key: key);

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Image.memory(thumData!),
    );
  }

  late Uint8List? thumData;

  Future<void> request_permission() async {
    //request permission
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      // success
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
      Fluttertoast.showToast(msg: "授权失败");
    }
    List<AssetPathEntity> list = await PhotoManager.getAssetPathList();
    print("------------");
    print(list.toString());
    print("------------");
    var res = await list[0].getAssetListRange(start: 0, end: 1);
    print(res[0].thumbData);
    thumData = await res[0].thumbData;
    print("------------");
  }

  @override
  void initState() {
    super.initState();
    request_permission();
  }
}
