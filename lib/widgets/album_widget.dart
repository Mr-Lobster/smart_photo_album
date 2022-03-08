import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/providers/album_provider.dart';
import 'package:smart_photo_album/widgets/imageitem_widget.dart';
import 'package:smart_photo_album/utils/request_permission.dart';

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
      return const CircularProgressIndicator();
    } else {
      return Image.memory(context.watch<AlbumProvider>().thumData[0]);
      // return Column(
      //   children: [
      //     Expanded(
      //       child: Container(
      //         color: Colors.white,
      //         child: Row(
      //           children: [
      //             Expanded(
      //               child: Padding(
      //                 padding: EdgeInsets.fromLTRB(0, 40, 1, 1),
      //                 child: Container(
      //                   color: Colors.white,
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Container(
      //                         child: Imageitem(
      //                           index: 0,
      //                         ),
      //                       ),
      //                       Container(
      //                         child: Imageitem(
      //                           index: 0,
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               flex: 1,
      //             ),
      //             Expanded(
      //               child: Padding(
      //                 padding: const EdgeInsets.fromLTRB(0, 40, 0, 1),
      //                 child: Container(
      //                   color: Colors.white,
      //                   width: double.infinity,
      //                   height: double.infinity,
      //                   child: Imageitem(
      //                     index: 0,
      //                   ),
      //                 ),
      //               ),
      //               flex: 2,
      //             )
      //           ],
      //         ),
      //       ),
      //       flex: 2,
      //     ),
      //     Expanded(
      //       child: Padding(
      //         padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      //         child: Container(
      //           color: Colors.white,
      //           child: Row(
      //             children: [
      //               Expanded(
      //                 child: Container(
      //                   color: Colors.white,
      //                   child: Imageitem(
      //                     index: 0,
      //                   ),
      //                 ),
      //                 flex: 1,
      //               ),
      //               Expanded(
      //                 child: Container(
      //                   color: Colors.white,
      //                   child: Imageitem(
      //                     index: 0,
      //                   ),
      //                 ),
      //                 flex: 1,
      //               ),
      //               Expanded(
      //                 child: Container(
      //                   color: Colors.white,
      //                   child: Imageitem(
      //                     index: 0,
      //                   ),
      //                 ),
      //                 flex: 1,
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       flex: 1,
      //     )
      //   ],
      // );
    }
  }

  @override
  void initState() {
    super.initState();
    RequestPermission.reqPhotomanagerPermis();
  }
}
