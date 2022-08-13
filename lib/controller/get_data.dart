import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/const/const.dart';
import '../model/news_model.dart';

class GetDataController extends GetxController {
  Future<List<News>> fetchData(category) async {
    var url = Uri.parse(
      '$baseUrl$language&$country&category=$category&apiKey=$apiKey',
    );

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

/////////////////////// //////////
  var pageIndex = 0.obs;

  List myText = [
    'Sports',
    'Entertainment',
    'Technology',
    'Business',
    'Health',
  ];
  List categoryTitls = [
    'sports',
    'entertainment',
    'technology',
    'business',
    'health',
  ];

  @override
  void onInit() {
    fetchData('');
    super.onInit();
  }
}
