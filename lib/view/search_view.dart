import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widgets/details_view.dart';
import 'package:news_app/view/widgets/news_card.dart';
import '../controller/get_data.dart';
import '../model/news_model.dart';

class SearchView extends SearchDelegate {
  GetDataController controller = Get.find();
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey.shade400,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query == '') {
            Get.back();
          } else {
            query = '';
          }
        },
        icon: query.isEmpty
            ? const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )
            : const Icon(
                Icons.close,
                color: Colors.black,
              ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Icon(
      Icons.search,
      color: Colors.black,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.grey.shade400,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.grey.shade400,
      child: FutureBuilder<List<News>>(
          future: controller.fetchData('sports'),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                color: Colors.grey.shade400,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey.shade400,
                    color: Colors.black,
                  ),
                ),
              );
            }
            List<News> newss = snapshot.data;
            var news = newss.where((e) {
              return e.title!.toLowerCase().contains(query.toLowerCase());
            }).toList();
            return query.isEmpty
                ? Container(
                    color: Colors.grey.shade400,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: StaggeredGridView.countBuilder(
                          padding: const EdgeInsets.all(0),
                          itemCount: news.length,
                          crossAxisCount: 1,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          staggeredTileBuilder: (i) =>
                              const StaggeredTile.fit(1),
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => DetailsView(
                                      headerText: news[i].title,
                                      contentText: news[i].description,
                                      img: news[i].imageUrl,
                                      catTitle: controller.myText[0],
                                    ));
                              },
                              child: NewsCard(
                                img: '${news[i].imageUrl}',
                                text: news[i].title,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          }),
    );
  }
}
