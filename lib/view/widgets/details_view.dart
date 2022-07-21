import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_appbar.dart';
import 'my_text.dart';


class DetailsView extends StatelessWidget {
  dynamic headerText;
  dynamic img;
  dynamic contentText;
  dynamic catTitle;
  DetailsView({
    Key? key,
    required this.headerText,
    required this.img,
    required this.contentText,
    this.catTitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
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
            //img
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                width: Get.width,
                height: 260,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400, width: 3),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(img ?? ''),
                    fit: BoxFit.fill,
                  ),
                )),
            const SizedBox(height: 10),
            //title
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: Get.width,
              child: MyText(
                text: headerText ?? 'لا يوجد محتوي',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontsize: 20,
                isMaxLines: true,
              ),
            ),
            const SizedBox(height: 10),
            //news
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(left: 10, right: 10),
              // width: Get.width,
              width: 100,
              padding: const EdgeInsets.all(5),

              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.white.withOpacity(0.7),
                    offset:const Offset(-7, 0),
                  ),
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.white.withOpacity(0.7),
                    offset:const Offset(0, -7),
                  ),
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.2),
                    offset:const Offset(7, 0),
                  ),
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: MyText(
                text: 'الخبر :-',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontsize: 30,
              ),
            ),
            const SizedBox(height: 10),
            //content
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: Get.width,
              child: MyText(
                text: contentText ?? 'لا يوجد محتوي',
                color: Colors.black,
                isMaxLines: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
