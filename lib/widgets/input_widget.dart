import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextviewWidget extends StatefulWidget {
  const TextviewWidget({Key? key}) : super(key: key);

  @override
  State<TextviewWidget> createState() => _TextviewWidgetState();
}

class _TextviewWidgetState extends State<TextviewWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextField(
        onSubmitted: (value) {
          if (kDebugMode) {
            print(value);
          }
        },
        controller: _controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              // 圆角
              splashColor: Colors.grey,
              // 溅墨色（波纹色）
              highlightColor: Colors.black,
              // 点击时的背景色（高亮色）
              onTap: () {
                if (kDebugMode) {
                  print(_controller.text.toString());
                }
              },
              // 点击事件
              child: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00FF0000)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          hintText: 'Search',
          hintStyle: const TextStyle(fontSize: 10),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00000000)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
      ),
    );
  }
}
