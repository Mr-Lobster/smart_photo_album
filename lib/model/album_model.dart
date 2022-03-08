import 'package:photo_manager/photo_manager.dart';

class AlbumModel {
  late List<AssetPathEntity> _assetEntityList;
  late int _assetLength; //用于记录有多少个相册
  late List<String> _entityNames;

  //构造函数
  AlbumModel() {
    loadAlbum();
  }

  //get&set
  get assetEntityList => _assetEntityList;

  get assetLength => _assetLength;

  get entityNames => _entityNames;

  //功能函数
  Future<void> loadAlbum() async {
    //读取本地所有相册
    _assetEntityList = await PhotoManager.getAssetPathList();
    //获得本地相册的数量
    _assetLength = _assetEntityList.length;

    for (var i = 0; i < _assetEntityList.length; i++) {
      //记录相册名称
      _entityNames.add(_assetEntityList[i].name);
    }
  }
}
