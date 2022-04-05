import 'dart:convert';
import 'dart:typed_data';
import 'dart:convert';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResponsePage extends StatefulWidget {
  ResponsePage({Key? key, required this.queryStr}) : super(key: key);
  String queryStr;

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  bool isLoading = true;
  late Response response;
  late String base64;

  void getHttp() async {
    try {
      var dio = Dio();

      response = await dio.get('http://10.32.92.214:5003/infer',
          queryParameters: {'str': widget.queryStr});
      base64 = response.data;
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
          title: const Text(
            "搜索结果: ",
          ),
        ),
        body: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : Image.memory(
                  base64Decode(base64),
                ),
        ));
  }
}
