import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';

class AlbumProvider with ChangeNotifier {
  late List<AssetPathEntity> _albums;
  late bool _isLoading = true;
  late List<Uint8List> _thumData;

  int index = 0;

  //构造函数
  AlbumProvider() {
    loadData();
  }

  bool get isLoading => _isLoading;

  List<AssetPathEntity> get albums => _albums;

  List<Uint8List> get thumData => _thumData;

  void loadData() async {
    //初始化_thumData
    _thumData = [];
    //初始化本地的相册对象
    _albums = await PhotoManager.getAssetPathList();
    for (var i = 0; i < _albums.length; i++) {
      List<AssetEntity> entities =
          await _albums[i].getAssetListRange(start: 0, end: 1);
      Uint8List? temp = await entities[0].thumbData;
      _thumData.add(temp!);
    }
    _isLoading = false;
    notifyListeners();
  }
}
