import 'package:flutter/material.dart';
import 'package:smart_photo_album/routes/search_page.dart';
import 'package:smart_photo_album/widgets/album_widget.dart';
import 'package:smart_photo_album/widgets/input_widget.dart';
import 'package:smart_photo_album/widgets/title_widget.dart';
import 'package:smart_photo_album/routes/setting_page.dart';

import '../utils/route_animation.dart';

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
                      child: ListTile(
                        trailing: GestureDetector(
                          onTap: () {
                            Navigator.push(context, CustomRoute(SettingPage()));
                          },
                          child: const Icon(Icons.sort),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: const TitleWidget(),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.white,
                        //child: TextviewWidget(),
                        child: GestureDetector(
                          // child: const TextviewWidget(),
                          child: const ListTile(
                            leading: Text(
                              "Search ...",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .push(CustomRoute(const SearchPage()));
                          },
                        ),
                      ),
                      flex: 2,
                    ),
                    const Expanded(
                      flex: 13,
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
