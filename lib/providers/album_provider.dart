import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:smart_photo_album/model/album_model.dart';

class AlbumProvider with ChangeNotifier {
  late AlbumModel _localAlbum;
  late List<AssetEntity> _entities;
  late bool _isLoading = true;
  late List<Uint8List> _thumData;
  int index = 0;

  //构造函数
  AlbumProvider() {
    loadData();
  }

  bool get isLoading => _isLoading;

  List<AssetEntity> get entities => _entities;

  List<Uint8List> get thumData => _thumData;

  void loadData() async {
    print("-------------------");
    //初始化本地的相册对象
    _localAlbum = AlbumModel();
    await Future.delayed(const Duration(seconds: 100), () {
      //获取每个相册的第一张图片
      for (var i = 0; i < _localAlbum.assetLength; i++) {
        List<AssetPathEntity> tempList = _localAlbum.assetEntityList;
        List<AssetEntity> entities = tempList[i]
            .getAssetListRange(start: 0, end: 1) as List<AssetEntity>;
        _entities.add(entities[0]);
        _thumData.add(entities[0].thumbData as Uint8List);
      }
      print("+++++++++++++");
      _isLoading = false;
      notifyListeners();
    });
  }
}
