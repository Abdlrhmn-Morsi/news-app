// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'my_text.dart';

class NewsCard extends StatelessWidget {
  var img;
  var text;
  NewsCard({
    this.text,
    this.img,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // gradient: LinearGradient(colors: [
              //   Colors.red.withOpacity(0.5),
              //   Colors.black.withOpacity(0.3),
              // ]),
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 135,
            right: 15,
            left: 10,
            child: MyText(
              text: text,
            ),
          ),
        ],
      ),
    );
  }
}