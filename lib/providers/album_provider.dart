import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:photo_manager/photo_manager.dart';

class album_provider with ChangeNotifier {
  late Uint8List _thumData;
  bool _isLoading = true;
  int index = 0;

  //构造函数
  album_provider() {
    load_album();
  }

  bool get isLoading => _isLoading;

  Uint8List get thumData => _thumData;

  Future<void> suffle_index() async {
    index++;
    List<AssetPathEntity> list = await PhotoManager.getAssetPathList();
    var res = await list[0].getAssetListRange(start: 0, end: 10);
    _thumData = (await res[index].thumbData)!;
    notifyListeners();
  }

  Future<void> load_album() async {
    List<AssetPathEntity> list = await PhotoManager.getAssetPathList();
    var res = await list[0].getAssetListRange(start: 0, end: 1);
    _thumData = (await res[index].thumbData)!;
    _isLoading = false;
    notifyListeners();
  }
}
