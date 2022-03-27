import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/album_provider.dart';
import '../utils/route_animation.dart';
import '../routes/album_content_page.dart';

class Imageitem extends StatelessWidget {
  Imageitem({Key? key, this.index = 0}) : super(key: key);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    if (context.watch<AlbumProvider>().albumLength >= index) {
      return GestureDetector(
        onTap: () {
          //Navigator.of(context).pushNamed("/AlbumsPage");
          Navigator.push(
              context,
              CustomRoute(AlbumContentPage(
                albumIndex: index,
              )));
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
