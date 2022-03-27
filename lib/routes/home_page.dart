import 'package:flutter/material.dart';
import 'package:smart_photo_album/widgets/album_widget.dart';
import 'package:smart_photo_album/widgets/input_widget.dart';
import 'package:smart_photo_album/widgets/title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false, //输入框抵住键盘
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 20 - 10,
                width: MediaQuery.of(context).size.width,
                //Flex的三个子widget
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: const TitleWidget(),
                      ),
                    ),
                    const Expanded(
                      child: Material(
                        color: Colors.white,
                        child: TextviewWidget(),
                      ),
                      flex: 1,
                    ),
                    const Expanded(
                      flex: 12,
                      child: AlbumWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
