import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../providers/album_provider.dart';
import '../providers/single_provider.dart';
import '../widgets/albumimage_widget.dart';

class AlbumContentPage extends StatefulWidget {
  AlbumContentPage({Key? key, required this.albumIndex}) : super(key: key);
  int albumIndex; //当前图集的编号
  @override
  State<AlbumContentPage> createState() => _AlbumContentPageState();
}

class _AlbumContentPageState extends State<AlbumContentPage> {
  @override
  Widget build(BuildContext context) {
    //Fluttertoast.showToast(msg: "我重新渲染了");
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
                  .getNameOfAlbum(widget.albumIndex)
                  .toString()),
        ),
        body: Center(
            child: context.watch<SingleProvider>().isLoading
                ? const CircularProgressIndicator()
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //每行三列
                      childAspectRatio: 1.0, //显示区域宽高相等
                    ),
                    itemCount: context.read<SingleProvider>().albumLength,
                    itemBuilder: (context, index) {
                      if (context.read<SingleProvider>().thumData.length ==
                          index) {
                        _retriveData();
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Albumimageitem(
                          albumIndex: widget.albumIndex, imgIndex: index);
                      // return Text("$index");
                    },
                  )));
  }

  void _retriveData() async {
    var res = await context.read<SingleProvider>().getMoreData();
    setState(() {});
  }
}
