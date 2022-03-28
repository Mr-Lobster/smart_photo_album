import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/providers/single_provider.dart';
import '../providers/album_provider.dart';
import '../routes/album_content_page4.dart';

//图库的封面
class Imageitem extends StatelessWidget {
  Imageitem({Key? key, this.index = 0}) : super(key: key);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    if (context.watch<AlbumProvider>().albumLength >= index + 1) {
      return GestureDetector(
        onTap: () {
          //Navigator.of(context).pushNamed("/AlbumsPage");
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider(
                create: (_) => SingleProvider(albumIndex: index),
                child: AlbumContentPage(
                  albumIndex: index,
                ),
                lazy: false,
              ); //返回的是需要跳转单页面
            },
          ));
        },
        child: AspectRatio(
            aspectRatio: 1,
            child: Expanded(
                child: Padding(
              padding: const EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.memory(
                  context.watch<AlbumProvider>().thumData[index],
                  fit: BoxFit.cover,
                ),
              ),
            ))),
      );
    } else {
      return Container(
        color: Colors.white,
      );
    }
  }
}
