import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/const/const.dart';
import 'my_text.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget {
  bool isDetail;
  dynamic function;
  dynamic title;

  CustomAppbar({
    Key? key,
    this.isDetail = false,
    this.function,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isDetail
              ? IconButton(
                  onPressed: function,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                )
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
          MyText(
            text: title,
            fontsize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          isDetail
              ? Container(
                  width: 40,
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.dark_mode_outlined,
                        ),
                      ),
                      Container(
                        child: personAppbar,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
