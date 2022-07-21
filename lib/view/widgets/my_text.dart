import 'package:flutter/material.dart';


class MyText extends StatelessWidget {
  dynamic text;
  dynamic color;
  bool isMaxLines;
  double fontsize;
  dynamic fontWeight;

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
