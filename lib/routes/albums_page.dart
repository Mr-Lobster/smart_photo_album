import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/widgets/imageitem_widget.dart';
import '../providers/album_provider.dart';
import 'package:smart_photo_album/widgets/textunderimg_widget.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  bool isLoading = true;
  late List<Row> albumList;
  late int len;

  @override
  Widget build(BuildContext context) {
    load();

    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.red,
          leading: const BackButton(),
          title: const Text('所有图集'),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: albumList,
              ));
  }

  void load() async {
    albumList = [];
    len = context.read<AlbumProvider>().albumLength;

    if (len % 3 == 0) {
      //可以被3整除
      for (int i = 0; i < len; i += 3) {
        albumList.add(Row(
          children: [
            Expanded(
              child: Imageitem(
                index: i,
              ),
              flex: 1,
            ),
            Expanded(
              child: Imageitem(
                index: i + 1,
              ),
              flex: 1,
            ),
            Expanded(
              child: Imageitem(
                index: i + 2,
              ),
              flex: 1,
            ),
          ],
        )); //添加图片
        albumList.add(Row(
          children: [
            Textunderimg(name: context.read<AlbumProvider>().getNameOfAlbum(i)),
            Textunderimg(
                name: context.read<AlbumProvider>().getNameOfAlbum(i + 1)),
            Textunderimg(
                name: context.read<AlbumProvider>().getNameOfAlbum(i + 2)),
          ],
        )); //添加相应的文字描述
      }
    } else {
      //不可以被3整除
      int i = 0;
      int j = 0;
      j = len % 3; //还剩几张
      for (; i < len - len % 3; i += 3) {
        albumList.add(Row(
          children: [
            Expanded(
              child: Imageitem(
                index: i,
              ),
              flex: 1,
            ),
            Expanded(
              child: Imageitem(
                index: i + 1,
              ),
              flex: 1,
            ),
            Expanded(
              child: Imageitem(
                index: i + 2,
              ),
              flex: 1,
            ),
          ],
        )); //添加图片
        albumList.add(Row(
          children: [
            Textunderimg(name: context.read<AlbumProvider>().getNameOfAlbum(i)),
            Textunderimg(
                name: context.read<AlbumProvider>().getNameOfAlbum(i + 1)),
            Textunderimg(
                name: context.read<AlbumProvider>().getNameOfAlbum(i + 2)),
          ],
        )); //添加相应的文字描述
      }
      if (j == 1) {
        albumList.add(Row(
          children: [
            Expanded(
              child: Imageitem(
                index: i,
              ),
              flex: 1,
            ),
            Expanded(
              child: Imageitem(
                index: len + 1,
              ),
              flex: 1,
            ),
            Expanded(
              child: Imageitem(
                index: len + 1,
              ),
              flex: 1,
            ),
          ],
        )); //添加图片
        albumList.add(Row(
          children: [
            Textunderimg(name: context.read<AlbumProvider>().getNameOfAlbum(i)),
            Textunderimg(name: ""),
            Textunderimg(name: ""),
          ],
        )); //添加相应的文字描述
      } else if (j == 2) {
        albumList.add(Row(
          children: [
            Expanded(
              child: Imageitem(
                index: i,
              ),
              flex: 1,
            ),
            Expanded(
              child: Imageitem(
                index: i + 1,
              ),
              flex: 1,
            ),
            Expanded(
              child: Imageitem(
                index: len + 1,
              ),
              flex: 1,
            ),
          ],
        )); //添加图片
        albumList.add(Row(
          children: [
            Textunderimg(name: context.read<AlbumProvider>().getNameOfAlbum(i)),
            Textunderimg(
                name: context.read<AlbumProvider>().getNameOfAlbum(i + 1)),
            Textunderimg(name: ""),
          ],
        )); //添加相应的文字描述
      }
    }

    // 延时1s执行返回
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }
}
