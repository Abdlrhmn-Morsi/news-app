import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';
import '../view/business_view.dart';
import '../view/entertainment_view.dart';
import '../view/health_view.dart';
import '../view/sports_view.dart';
import '../view/technology_view.dart';

class GetDataController extends GetxController {
  List<News> news = [];
  Future<List<News>> fetchData(category) async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?language=ar&country=eg&category=$category&apiKey=984005c37e8847f49f9ceaa50f3479b8');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<News> news = [];
      var jsonString = jsonDecode(response.body);
      for (var e in (jsonString['articles'] as List)) {
        news.add(News.fromJson(e));
      }
      print('${news.length}= ===========');
      return news;
    } else {
      return throw {'error occured'};
    }
  }

//  (jsonString['articles'] as List).forEach((e) {
//         news.add(News.fromJson(e));
//       });
/////////////////////// //////////
  var pageIndex = 0.obs;
  List<Widget> myPages = [
    SportsView(),
    EntertainmentView(),
    TechnologyView(),
    BusinessView(),
    HealthView(),
  ];

  List myText = [
    'رياضه',
    'فن',
    'تكنولوجي',
    'أعمال',
    'صحه',
  ];

  @override
  void onInit() {
    fetchData('');
    super.onInit();
  }
}
