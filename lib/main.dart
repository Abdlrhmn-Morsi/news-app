import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/view/screens/home_view.dart';
import 'controller/get_data.dart';

void main() {
  runApp(const MyApp());
  GetDataController getDataController = Get.put(GetDataController());
  SystemChrome.setSystemUIOverlayStyle(
    (const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    )),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'News App',
      //locale: Locale('ar', 'AE'),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
