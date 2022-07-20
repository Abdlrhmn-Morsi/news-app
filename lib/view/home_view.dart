import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/controller/get_data.dart';
import 'package:news_app/view/widgets/category_icon.dart';
import 'package:news_app/view/widgets/custom_appbar.dart';


class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.grey.shade400,

      body: Column(
        children: [
          SizedBox(height: 60),
          CustomAppbar(),
          const SizedBox(height: 20),
          CategoryIcon(),
          const SizedBox(height: 20),
          GetX<GetDataController>(
            builder: ((controller) {
              return Expanded(child: controller.myPages[controller.pageIndex.value]);
            }),
          )
        ],
      ),
    );
  }
}
