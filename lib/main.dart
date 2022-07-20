import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_app/view/home_view.dart';
import 'controller/get_data.dart';

void main() {
  runApp(const MyApp());
  GetDataController getDataController = Get.put(GetDataController());
  SystemChrome.setSystemUIOverlayStyle(
    (SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override                            
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Localizations Sample App',
      locale: Locale('ar', 'AE'),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
