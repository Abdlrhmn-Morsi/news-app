import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_app/controller/get_data.dart';
import 'package:news_app/view/screens/news_feed.dart';
import 'package:news_app/view/widgets/category_icon.dart';
import 'package:news_app/view/widgets/custom_appbar.dart';
import 'package:news_app/view/widgets/custom_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 60),
          CustomAppbar(title:  '#Here is some News '),
          const SizedBox(height: 20),
          CategoryIcon(),
          GetX<GetDataController>(
            builder: ((controller) {
              return NewsFeed(
                catNames: controller.categoryTitls[controller.pageIndex.value],
              );
            }),
          )
        ],
      ),
    );
  }
}
