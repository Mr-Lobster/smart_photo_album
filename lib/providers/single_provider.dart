import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

import 'album_provider.dart';

class SingleProvider with ChangeNotifier {
  int albumIndex = 0; //当前图集的索引号
  late List<Uint8List> thumData;
  late List<Uint8List> originBytes;
  late int albumLength;
  late AssetPathEntity Albumasset; //当前图集句柄
  late bool _isLoading = true;
  int current_page = 0;

  SingleProvider({required this.albumIndex}) {
    _initData();
  }

  bool get isLoading => _isLoading;

  void _initData() async {
    //初始化 _thumData
    thumData = [];
    var _albums = await PhotoManager.getAssetPathList();
    Albumasset = _albums[albumIndex];
    //初始化本地的相册对象
    albumLength = Albumasset.assetCount;
    //初始默认加载20张
    List<AssetEntity> entities =
        await Albumasset.getAssetListPaged(current_page++, 20);
    for (int i = 0; i < entities.length; i++) {
      Uint8List? temp = await entities[i].thumbData;
      Uint8List? temp1 = await entities[i].originBytes;
      thumData.add(temp!);
      originBytes.add(temp1!);
    }

    _isLoading = false;
    notifyListeners();
  }

  void getMoreData() async {
    List<AssetEntity> entities =
        await Albumasset.getAssetListPaged(current_page++, 20);
    for (int i = 0; i < entities.length; i++) {
      Uint8List? temp = await entities[i].thumbData;
      Uint8List? temp1 = await entities[i].originBytes;
      thumData.add(temp!);
      originBytes.add(temp1!);
    }
    //1秒后
    Future.delayed(const Duration(milliseconds: 3000), () {
      notifyListeners();
    });
  }

  Future<Uint8List> getOriginBytes(int Img_Index) async {
    List<AssetEntity> entities = await Albumasset.getAssetListRange(
        start: Img_Index, end: Img_Index + 1);
    Uint8List? temp = await entities[0].originBytes;
    return temp!;
  }
}
