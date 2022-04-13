import 'package:flutter/material.dart';
import 'package:smart_photo_album/routes/response_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int current_search = 0;
  late TextEditingController _controller;
  var _radioGroupValue = '万物检索';
  List<String> advice = [
    "一名男子穿着白灰色条纹衬衫，一条绿色裤子和一双鞋",
    "那个男人留着短发。他肌肉发达，穿着一件白色条纹的绿色背心。他穿着绿色的裤子。他脖子上挂着粉色的耳机。他手里拿着一个杯子。",
    "这个男人穿着绿色的裤子和一件绿黑条纹的背心。他留着寸头，脖子上戴着粉色的耳机",
    "这名男子穿着一件黑白条纹的背心，穿着绿色的紧身裤，脖子上挂着粉色的耳机",
    "一个人穿着白色t恤和修长的黑色裤子，右肩上背着一个黑色的挎包，右手拿着一个直立的黑色物体",
    "这名男子留着黑色短发，穿着白色t恤、黑色裤子和黑色背包",
    "年轻人，深色头发，戴眼镜，深色和浅色图案的衬衫，短袖，左肩上背着黑色的包，深色的裤子，浅色的鞋子",
    "这名男子穿白衬衫，黑裤子，拿着一个黑色的书包过马路",
    "一个男人穿着浅蓝色的衬衫，一条黑色的裤子和一双灰色的鞋子",
    "他穿着浅色t恤，深色裤子，浅色运动鞋。他有一个黑色的大背包和一副眼镜",
    "一个棕色头发的女孩，梳着波波头，穿着牛仔裤和黑灰色t恤，正从镜头前走开",
    "一名女子穿着短袖，黑白相间的蓝色条纹衬衫，一条蓝色牛仔裤裤子和一双紫白相间的鞋子",
    "这个小女孩穿着浅蓝色的紧身牛仔裤和灰色的束腰上衣。她的鞋子上有霓虹绿色的鞋带。她有一个背包在前面",
    "一个黑头发到耳朵的女人，前面背着一个深蓝色的双肩包，戴着眼镜，穿着灰色的t恤和一双系着亮色鞋带的运动鞋",
    "那个女人肩上背着一个黑白相间的钱包，她在微笑",
    "一个女人穿着黄色的衬衫，黑白相间的印花裤子和黑白相间的鞋子",
    "这个女人穿着一件青色的t恤，黑色的裤子和蓝色的网球鞋。她戴着眼镜，背着一个红色的背包",
    "一个女人穿着蓝色的衬衫，一条深蓝色的裤子和一双黑白相间的鞋子",
    "黑发男子戴眼镜，穿长袖衬衫，深色牛仔裤和黑色鞋子",
    "一名留着黑色短发的男子穿着灰黑相间的夹克、黑色的裤子、黑色的鞋子和黑色的背包",
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
                              queryStr: (current_search++).toString(),
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
                                    queryStr: (current_search++).toString(),
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
                //width: MediaQuery.of(context).size.width - 10,
                child: Container(
                  child: _buildEditable(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 50,
                child: Text("搜索建议:",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Expanded(
                // height: MediaQuery.of(context).size.height - 280,
                child: ListView.separated(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ResponsePage(
                                queryStr: index.toString(),
                                mode: 1,
                              ); //返回的是需要跳转单页面
                            },
                          ));
                        },
                        child: SizedBox(
                          child: ListTile(
                            title: Text(
                              (index + 1).toString() + ":  " + advice[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      color: Colors.grey,
                    );
                  },
                ),
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
