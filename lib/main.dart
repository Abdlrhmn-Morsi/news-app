import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/controller/dark_mode_controller.dart';
import 'package:news_app/view/screens/home_view.dart';
import 'const/themes.dart';
import 'controller/injection.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init();
  Injection();
  runApp(const MyApp());
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
    final DarkModeController controller = Get.find();

    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: controller.theme,
      home: HomeView(),
    );
  }
}
