import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widgets/details_view.dart';
import 'package:news_app/view/widgets/news_card.dart';
import 'package:news_app/view/widgets/news_view.dart';


import '../controller/get_data.dart';
import '../model/news_model.dart';

class BusinessView extends StatefulWidget {
  BusinessView({Key? key}) : super(key: key);

  @override
  State<BusinessView> createState() => _HomeViewState();
}

class _HomeViewState extends State<BusinessView> {
  GetDataController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return NewsView(
      catName: 'business',
      controller: controller,
    );
  }
}
