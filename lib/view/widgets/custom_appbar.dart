import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../search_view.dart';
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
                  icon: const Icon(Icons.arrow_back),
                )
              : IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchView(),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
          MyText(
            text: isDetail ? title : ' أخبار اليوم',
            color: Colors.black,
            fontsize: 22,
            fontWeight: FontWeight.bold,
          ),
          isDetail
              ? Container(
                  width: 40,
                )
              : IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
        ],
      ),
    );
  }
}
