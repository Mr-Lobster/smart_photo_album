import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.red,
        leading: const BackButton(),
        title: const Text("设置"),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.color_lens),
            title: Text("跟随系统主题"),
            subtitle: Text("已自动开启"),
          ),
          const Divider(
            height: 0,
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text("关于应用"),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Scaffold(
                  appBar: AppBar(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Colors.red,
                    leading: const BackButton(),
                    title: const Text("关于应用"),
                  ),
                  body: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 100, 0, 100),
                        child: Container(
                          height: 150,
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(
                              "assets/images/app_icon.png",
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 0),
                      const ListTile(
                        title: Text(
                          "应用名称",
                        ),
                        trailing: Text("万物检索图库"),
                      ),
                      const Divider(height: 0),
                      const ListTile(
                        title: Text("版本号"),
                        trailing: Text("2.18.1215"),
                      ),
                      const Divider(height: 0),
                      const ListTile(
                        title: Text("编译版本"),
                        trailing: Text("30"),
                      ),
                      const Divider(height: 0),
                    ],
                  ),
                );
              }));
            },
          ),
          const Divider(
            height: 0,
          ),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.group),
              title: Text("开发人员"),
              trailing: Text("NjTech CV Lab"),
            ),
            onTap: () async {
              var url =
                  "mqqapi://card/show_pslcard?src_type=internal&version=1&uin=837311914";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          const Divider(height: 0),
          GestureDetector(
            child: const ListTile(
              leading: Icon(Icons.email),
              title: Text("联系方式"),
              trailing: Text("837311914@qq.com"),
            ),
            onTap: () async {
              var url = "mailto:837311914@qq.com?subject=联系开发人员&body=请输入：";
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          const Divider(height: 0),
          Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 25, 100),
            child: FlatButton(
              onPressed: () => exit(0),
              child: const Text(
                "退出应用",
              ),
              color: Colors.red,
              colorBrightness: Brightness.dark,
            ),
          )
        ],
      ),
    );
  }
}
