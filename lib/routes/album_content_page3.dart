import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/widgets/albumimage_widget.dart';
import '../providers/album_provider.dart';
import '../providers/single_provider.dart';

class AlbumContentPage extends StatelessWidget {
  AlbumContentPage({Key? key, required this.albumIndex}) : super(key: key);
  int albumIndex; //当前图集的编号

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Colors.red,
              leading: const BackButton(),
              title: Text("当前图集: " +
                  context
                      .read<AlbumProvider>()
                      .getNameOfAlbum(albumIndex)
                      .toString()),
            ),
            body: Center(
                child: context.watch<SingleProvider>().isLoading
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          if (context.watch<SingleProvider>().thumData.length <=
                              index) {
                            context.watch<SingleProvider>().getMoreData();
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Albumimageitem(Img_index: index);
                        },
                        itemCount: context.read<SingleProvider>().albumLength,
                      ))));
  }
}
