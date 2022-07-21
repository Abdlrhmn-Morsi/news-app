import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widgets/news_view.dart';
import '../controller/get_data.dart';


class TechnologyView extends StatefulWidget {
  TechnologyView({Key? key}) : super(key: key);

  @override
  State<TechnologyView> createState() => _HomeViewState();
}

class _HomeViewState extends State<TechnologyView> {
  GetDataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return NewsView(
      catName: 'technology',
      controller: controller,
    );
  }
}
