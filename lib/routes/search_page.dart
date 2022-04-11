import 'package:flutter/material.dart';
import 'package:smart_photo_album/routes/response_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;
  var _radioGroupValue = '万物检索';
  List<String> advice = [
    "一个男人在足球场上指导一群小孩",
    "一只小鸟在井边喝水",
    "一个男人在足球场上指导一群小孩",
    "一只小鸟在井边喝水",
    "一个男人在足球场上指导一群小孩",
    "一只小鸟在井边喝水",
    "一个男人在足球场上指导一群小孩",
    "一只小鸟在井边喝水",
    "一个男人在足球场上指导一群小孩",
    "一只小鸟在井边喝水",
  ];

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 50,
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      if (_radioGroupValue == "万物检索") {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            var input = _controller.text.toString();
                            return ResponsePage(
                              queryStr: input,
                              mode: 0,
                            ); //返回的是需要跳转单页面
                          },
                        ));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            var input = _controller.text.toString();
                            return ResponsePage(
                              queryStr: input,
                              mode: 1,
                            ); //返回的是需要跳转单页面
                          },
                        ));
                      }
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      labelText: '检索内容：',
                      labelStyle: const TextStyle(color: Colors.grey),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                      suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(16.0),
                          // 圆角
                          splashColor: Colors.grey,
                          // 溅墨色（波纹色）
                          highlightColor: Colors.black,
                          // 点击时的背景色（高亮色）
                          onTap: () {
                            if (_radioGroupValue == "万物检索") {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  var input = _controller.text.toString();
                                  return ResponsePage(
                                    queryStr: input,
                                    mode: 0,
                                  ); //返回的是需要跳转单页面
                                },
                              ));
                            } else {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  var input = _controller.text.toString();
                                  return ResponsePage(
                                    queryStr: input,
                                    mode: 1,
                                  ); //返回的是需要跳转单页面
                                },
                              ));
                            }
                          },
                          // 点击事件
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                          )),
                    ),
                    cursorColor: const Color(0xE5000000),
                  )),
              SizedBox(
                height: 50,
                child: _buildEditable(),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                  height: 50,
                  child: Expanded(
                    child: Text("搜索建议:",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              Expanded(
                // height: MediaQuery.of(context).size.height - 280,
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ResponsePage(
                                  queryStr: advice[index % 10],
                                  mode: 2,
                                ); //返回的是需要跳转单页面
                              },
                            ));
                          },
                          child: ListTile(
                            leading: Text(index.toString() +
                                " :   " +
                                advice[index % 10]),
                          ));
                    }),
              )
            ],
          ),
        ));
  }

  _buildEditable() {
    return Row(
      children: <Widget>[
        Expanded(
          child: RadioListTile(
            value: '万物检索',
            groupValue: _radioGroupValue,
            onChanged: (value) {
              setState(() {
                _radioGroupValue = value.toString();
              });
            },
            title: const Text("万物检索"),
          ),
          flex: 1,
        ),
        Expanded(
          child: RadioListTile(
            value: '人物检索',
            groupValue: _radioGroupValue,
            onChanged: (value) {
              setState(() {
                _radioGroupValue = value.toString();
              });
            },
            title: const Text("人物检索"),
          ),
          flex: 1,
        )
      ],
    );
  }
}
