import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import '../providers/album_provider.dart';

class AlbumContentPage extends StatelessWidget {
  AlbumContentPage({Key? key, required this.albumIndex}) : super(key: key);
  int albumIndex; //当前图集的编号

  @override
  Widget build(BuildContext context) {
    AssetPathEntity asset = context.read<AlbumProvider>().getAlbum(albumIndex);
    return Center(
      child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.red,
            leading: const BackButton(),
            title: Text("当前图集: " +
                context
                    .read<AlbumProvider>()
                    .getNameOfAlbum(albumIndex)
                    .toString()),
          ),
          body: Center(
            child: Text(asset.assetCount.toString()),
          )),
    );
  }
}
