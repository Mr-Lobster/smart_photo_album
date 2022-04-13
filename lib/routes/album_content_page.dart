import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/widgets/albumimage_widget.dart';
import '../providers/album_provider.dart';
import '../providers/single_provider.dart';

class AlbumContentPage extends StatelessWidget {
  AlbumContentPage({Key? key, required this.albumIndex}) : super(key: key);
  int albumIndex; //当前图集的编号

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    .toString())),
        body: Center(
            child: context.watch<SingleProvider>().isLoading
                ? const CircularProgressIndicator()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //每行三列
                      childAspectRatio: 1.0, //显示区域宽高相等
                    ),
                    itemCount:
                        context.watch<SingleProvider>().thumData.length + 1,
                    itemBuilder: (context, index) {
                      if (index ==
                          context.watch<SingleProvider>().thumData.length) {
                        if (index ==
                            context.watch<SingleProvider>().albumLength) {
                          return const Center(
                            child: Text("加载完毕"),
                          );
                        } else {
                          context.watch<SingleProvider>().getMoreData();
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                      return Albumimageitem(
                          albumIndex: albumIndex, imgIndex: index);
                    },
                  )));
  }
}
