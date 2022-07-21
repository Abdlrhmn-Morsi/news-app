import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widgets/news_view.dart';
import '../controller/get_data.dart';

class HealthView extends StatefulWidget {
  HealthView({Key? key}) : super(key: key);

  @override
  State<HealthView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HealthView> {
  GetDataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return NewsView(
      catName: 'health',
      controller: controller,
    );
  }
}
