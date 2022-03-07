import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/album_provider.dart';

class Imageitem extends StatelessWidget {
  const Imageitem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.memory(context.watch<album_provider>().thumData),
    );
  }
}
