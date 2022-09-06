import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/dark_mode_controller.dart';
import '../../controller/get_data.dart';

class CategoryIcon extends StatelessWidget {
  GetDataController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Get.width,
      height: 60,
      child: Expanded(
        flex: 1,
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryTitls.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                controller.pageIndex.value = i;
              },
              child: GetX<GetDataController>(
                builder: ((controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 5, left: 5),
                        child: GetBuilder<DarkModeController>(
                          builder: (darkModeController) => Container(
                            margin: i == 4
                                ? const EdgeInsets.only(left: 10, right: 5)
                                : i == 0
                                    ? const EdgeInsets.only(left: 8, right: 10)
                                    : const EdgeInsets.only(left: 8, right: 0),
                            alignment: Alignment.center,
                            height: 35,
                            width: 80,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: controller.pageIndex.value == i
                                  ? darkModeController.getThemeFromBox()
                                      ? Colors.deepPurple.shade200
                                      : Colors.deepPurple
                                  : darkModeController.getThemeFromBox()
                                      ? Colors.grey.shade200
                                      : Colors.black,
                            ),
                            child: Text(
                              controller.myText[i],
                              maxLines: 1,
                              style: TextStyle(
                                letterSpacing: 1,
                                color: controller.pageIndex.value == i
                                    ? darkModeController.getThemeFromBox()
                                        ? Colors.black
                                        : Colors.white
                                    : darkModeController.getThemeFromBox()
                                        ? Colors.deepPurple
                                        : Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                      controller.pageIndex.value == i
                          ? Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GetBuilder<DarkModeController>(
                                builder: (darkModeController) => Container(
                                  width: 50,
                                  height: 3,
                                  color: darkModeController.getThemeFromBox()
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
