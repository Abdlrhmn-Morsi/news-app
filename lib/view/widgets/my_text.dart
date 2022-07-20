// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyText extends StatelessWidget {
  var text;
  var color;
  bool isMaxLines;

  double fontsize;
  var fontWeight;
   MyText({
    Key? key,
    this.isMaxLines =false,
    this.color =Colors.white,
    this.fontsize = 16,
    this.fontWeight,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines:isMaxLines?null: 2,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight:fontWeight ,
        color:color,
        overflow:isMaxLines?null: TextOverflow.ellipsis
      ),
    );
  }
}
