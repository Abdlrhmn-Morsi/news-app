import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/my_text.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  dynamic headerText;
  dynamic img;
  dynamic contentText;
  dynamic catTitle;
  dynamic id;
  DetailsView({
    Key? key,
    this.id,
    required this.headerText,
    required this.img,
    required this.contentText,
    this.catTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70),
            //app bar
            CustomAppbar(
              isDetail: true,
              title: '#$catTitle',
              function: () {
                Get.back();
              },
            ),
            const SizedBox(height: 20),
            //title
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: Get.width,
              child: MyText(
                text: headerText ?? 'لا يوجد محتوي',
                fontWeight: FontWeight.bold,
                fontsize: 20,
                isMaxLines: true,
              ),
            ),
            const SizedBox(height: 20),
            //img
            Hero(
              tag: id,
              child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: Get.width,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(img ?? ''),
                      fit: BoxFit.fill,
                    ),
                  )),
            ),
            //news
            const SizedBox(height: 15),
            //content
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: Get.width,
              child: MyText(
                text: contentText ?? 'لا يوجد محتوي',
                isMaxLines: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
