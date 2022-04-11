import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_photo_album/routes/search_page.dart';
import 'package:smart_photo_album/utils/route_animation.dart';
import '../routes/response_page.dart';

class TextviewWidget extends StatefulWidget {
  const TextviewWidget({Key? key}) : super(key: key);

  @override
  State<TextviewWidget> createState() => _TextviewWidgetState();
}

class _TextviewWidgetState extends State<TextviewWidget> {
  late TextEditingController _controller;

  FocusNode _commentFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _commentFocus.unfocus(); // 失去焦点
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: TextField(
        onSubmitted: (value) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              var input = _controller.text.toString();
              return ResponsePage(queryStr: input); //返回的是需要跳转单页面
            },
          ));
        },
        controller: _controller,
        textInputAction: TextInputAction.search,
        maxLines: 1,
        // maxLength: 38,
        decoration: InputDecoration(
          suffixIcon: InkWell(
              borderRadius: BorderRadius.circular(16.0),
              // 圆角
              splashColor: Colors.grey,
              // 溅墨色（波纹色）
              highlightColor: Colors.black,
              // 点击时的背景色（高亮色）
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    var input = _controller.text.toString();
                    return ResponsePage(queryStr: input); //返回的是需要跳转单页面
                  },
                ));
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
    ));
  }
}
