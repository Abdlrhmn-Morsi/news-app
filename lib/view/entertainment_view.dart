import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widgets/news_view.dart';
import '../controller/get_data.dart';

class EntertainmentView extends StatefulWidget {
  EntertainmentView({Key? key}) : super(key: key);

  @override
  State<EntertainmentView> createState() => _HomeViewState();
}

class _HomeViewState extends State<EntertainmentView> {
  GetDataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return NewsView(
      catName: 'entertainment',
      controller: controller,
    );
  }
}
