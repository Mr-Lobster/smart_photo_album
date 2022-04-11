import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_photo_album/widgets/imageitem_widget.dart';
import 'package:smart_photo_album/widgets/responseimage_widget.dart';

class ResponsePage extends StatefulWidget {
  ResponsePage({Key? key, required this.queryStr, this.mode = 0})
      : super(key: key);
  String queryStr;
  int mode = 0;

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  bool isLoading = true;
  late Response response;
  late List<dynamic> base64;

  void getHttp() async {
    try {
      var dio = Dio();

      response = await dio.get('http://10.32.86.180:5003/infer',
          queryParameters: {'str': widget.queryStr, 'mode': widget.mode});
      base64 = response.data;
      //print(base64[0].toString());
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      print("---------------------------");
      print(e.toString());
      print("---------------------------");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
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
          title: const Text("搜索结果"),
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, //每行三列
                    childAspectRatio: 1.0, //显示区域宽高相等
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Responseimage(
                        thumData: base64Decode(base64[index].toString()));
                    // return Text("$index");
                  },
                ),
        ));
  }
}
