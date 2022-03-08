import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AlbumModel {
  late List<AssetPathEntity> _assetEntityList;
  late List<AssetEntity> _entities;

  get assetEntityList => _assetEntityList;

  get entities => _entities;

  //构造函数
  AlbumModel() {}
}
