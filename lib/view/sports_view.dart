import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widgets/news_view.dart';
import '../controller/get_data.dart';

class SportsView extends StatefulWidget {
  SportsView({Key? key}) : super(key: key);

  @override
  State<SportsView> createState() => _HomeViewState();
}

class _HomeViewState extends State<SportsView> {
  GetDataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return NewsView(
      catName: 'sports',
      controller: controller,
    );
  }
}
