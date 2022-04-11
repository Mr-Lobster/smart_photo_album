import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.red,
          leading: const BackButton(),
          title: const Text(
            "搜索页面",
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Text('Item$index');
          },
          itemExtent: 50,
        ));
  }
}
