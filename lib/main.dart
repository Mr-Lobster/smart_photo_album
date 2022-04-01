import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_photo_album/providers/album_provider.dart';
import 'package:smart_photo_album/utils/request_permission.dart';
import 'routes/home_page.dart';
import 'routes/albums_page.dart';
import 'providers/single_provider.dart';
import 'utils/request_permission.dart';

void main() {
  runApp(

      /// Providers are above [MyApp] instead of inside it, so that tests
      /// can use [MyApp] while mocking the providers
      MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AlbumProvider(),
        lazy: false,
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RequestPermission.reqPhotomanagerPermis();
    return MaterialApp(
      initialRoute: "/", // 默认加载的界面，这里为RootPage
      routes: {
        // 显式声明路由
        "/": (context) => const HomePage(),
        "/AlbumsPage": (context) => AlbumsPage(),
        //Navigator.of(context).pushNamed("/A");
        //Navigator.pop(context);
      },
    );
  }
}
