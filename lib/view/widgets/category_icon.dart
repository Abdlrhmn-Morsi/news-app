import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          scrollDirection: Axis.horizontal,
          itemCount: controller.myPages.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                controller.pageIndex.value = i;
              },
              child: GetX<GetDataController>(
                builder: ((controller) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      margin: i == 4
                          ? const EdgeInsets.only(left: 10, right: 5)
                          : i == 0
                              ? const EdgeInsets.only(left: 8, right: 10)
                              : const EdgeInsets.only(left: 8, right: 0),
                      alignment: Alignment.center,
                      height: 30,
                      width: 80,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black.withOpacity(0.5), width: 2),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.white.withOpacity(0.7),
                            offset: const Offset(-7, 0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.white.withOpacity(0.7),
                            offset: const Offset(0, -7),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(7, 0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.2),
                            offset: const Offset(0, 7),
                          ),
                        ],
                        color: controller.pageIndex.value == i
                            ? Colors.grey.shade200
                            : Colors.black,
                      ),
                      child: Text(
                        controller.myText[i],
                        maxLines: 1,
                        style: TextStyle(
                            letterSpacing: 1,
                            color: controller.pageIndex.value == i
                                ? Colors.black
                                : Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
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
