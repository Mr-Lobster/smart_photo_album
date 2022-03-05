import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/home_page.dart';

void main() {
  runApp(

      /// Providers are above [MyApp] instead of inside it, so that tests
      /// can use [MyApp] while mocking the providers
      // MultiProvider(
      //   providers: [],
      //   child: const MyApp(),
      // ),
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
