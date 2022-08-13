import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/get_data.dart';
import 'package:news_app/view/widgets/news_view.dart';
import '../../controller/get_data.dart';

// ignore: must_be_immutable
class NewsFeed extends StatelessWidget {
  String? catNames;

  NewsFeed({Key? key, required this.catNames}) : super(key: key);

  GetDataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return NewsView(
      catName: catNames,
      controller: controller,
    );
  }
}
