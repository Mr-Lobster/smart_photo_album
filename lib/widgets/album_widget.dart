import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/providers/album_provider.dart';
import 'package:smart_photo_album/widgets/imageitem_widget.dart';

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
        context.read<album_provider>().suffle_index();
      },
      child: Container(
        color: Colors.lightBlueAccent,
        child: loadAndShow(context),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  Future<void> request_permission() async {
    //request permission
    var result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      // success
    } else {
      // fail
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
      Fluttertoast.showToast(msg: "授权失败");
    }
  }

  Widget loadAndShow(BuildContext context) {
    if (context.watch<album_provider>().isLoading == true) {
      return const CircularProgressIndicator();
    } else {
      //return Image.memory(context.watch<album_provider>().thumData);
      return Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Expanded(
                        child: Imageitem(),
                        flex: 1,
                      ),
                      Expanded(
                        child: Imageitem(),
                        flex: 1,
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                const Expanded(
                  child: Imageitem(),
                  flex: 2,
                )
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: Imageitem(),
                  flex: 1,
                ),
                Expanded(
                  child: Imageitem(),
                  flex: 1,
                ),
                Expanded(
                  child: Imageitem(),
                  flex: 1,
                )
              ],
            ),
            flex: 1,
          ),
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    request_permission();
  }
}
