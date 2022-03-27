import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';

class AlbumProvider with ChangeNotifier {
  late List<AssetPathEntity> _albums;
  late bool _isLoading = true;
  late List<Uint8List> _thumData;
  late int _albumLength;
  int index = 0;

  //构造函数
  AlbumProvider() {
    _initData();
  }

  bool get isLoading => _isLoading;

  int get albumLength => _albumLength;

  List<AssetPathEntity> get albums => _albums;

  List<Uint8List> get thumData => _thumData;

  void _initData() async {
    //初始化 _thumData
    _thumData = [];

    //初始化本地的相册对象
    _albums = await PhotoManager.getAssetPathList();
    _albumLength = _albums.length;
    for (var i = 0; i < _albumLength; i++) {
      List<AssetEntity> entities =
          await _albums[i].getAssetListRange(start: 0, end: 1);
      Uint8List? temp = await entities[0].thumbData;
      _thumData.add(temp!);
    }

    _isLoading = false;
    notifyListeners();
  }

  Uint8List getFirstOfAlbum(int albumIndex) {
    return _thumData[albumIndex];
  }

  String getNameOfAlbum(int albumIndex) {
    return _albums[albumIndex].name;
  }

  AssetPathEntity getAlbum(int albumIndex) {
    return _albums[albumIndex];
  }
}
