import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';

class SingleProvider with ChangeNotifier {
  int albumIndex = 0; //当前图集的索引号
  late List<Uint8List> thumData;
  late int albumLength;
  late AssetPathEntity Albumasset; //当前图集句柄
  late bool _isLoading = true;
  late int current_page;

  SingleProvider({required this.albumIndex}) {
    _initData();
  }

  bool get isLoading => _isLoading;

  void _initData() async {
    current_page = 0;
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
      thumData.add(temp!);
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<int> getMoreData() async {
    List<AssetEntity> entities =
        await Albumasset.getAssetListPaged(current_page++, 20);

    for (int i = 0; i < entities.length; i++) {
      Uint8List? temp = await entities[i].thumbData;
      thumData.add(temp!);
    }
    notifyListeners();
    return 1;
  }
}
