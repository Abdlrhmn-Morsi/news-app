import 'package:get/get.dart';
import 'package:news_app/controller/dark_mode_controller.dart';
import 'package:news_app/controller/get_data.dart';

class Injection {
  DarkModeController darkModeController = Get.put(DarkModeController());
  GetDataController getDataController = Get.put(GetDataController());
}
