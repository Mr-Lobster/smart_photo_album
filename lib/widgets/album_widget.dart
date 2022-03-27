import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/providers/album_provider.dart';
import 'package:smart_photo_album/widgets/imageitem_widget.dart';
import 'package:smart_photo_album/utils/request_permission.dart';

import '../routes/albums_page.dart';
import '../utils/route_animation.dart';
import 'imageitem_widget.dart';

class AlbumWidget extends StatefulWidget {
  const AlbumWidget({Key? key}) : super(key: key);

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //context.read<album_provider>().suffle_index();
      },
      child: Container(
        color: Colors.white,
        child: loadAndShow(context),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  Widget loadAndShow(BuildContext context) {
    if (context.watch<AlbumProvider>().isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, CustomRoute(AlbumsPage()));
                    },
                    child: const Text(
                      "更多图集 >",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ))),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 1, 1),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Imageitem(
                                index: 1,
                              ),
                            ),
                            Container(
                              child: Imageitem(
                                index: 2,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 1),
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                        height: double.infinity,
                        child: Imageitem(
                          index: 0,
                        ),
                      ),
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Imageitem(
                          index: 3,
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Imageitem(
                          index: 4,
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Imageitem(
                          index: 5,
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ),
            flex: 1,
          )
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    RequestPermission.reqPhotomanagerPermis();
  }
}
