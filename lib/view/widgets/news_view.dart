import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:news_app/view/screens/details_view.dart';
import 'package:news_app/view/widgets/my_text.dart';
import 'package:news_app/view/widgets/news_card.dart';
import '../../model/news_model.dart';

// ignore: must_be_immutable
class NewsView extends StatelessWidget {
  dynamic catName;
  dynamic controller;
  NewsView({
    Key? key,
    required this.catName,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
        future: controller.fetchData(catName),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<News> news = snapshot.data;

          return Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      bottom: 8,
                    ),
                    child: MyText(
                      text: ' Breaking News .. ',
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontsize: 20,
                    ),
                  ),
                  Hero(
                    tag: news[5],
                    child: GestureDetector(
                      onTap: () => Get.to(
                        transition: Transition.cupertino,
                        () => DetailsView(
                          id: news[5],
                          headerText: news[5].title,
                          contentText: news[5].description,
                          img: news[5].imageUrl,
                          catTitle: 'Breaking News',
                        ),
                      ),
                      child: NewsCard(
                        img: news[5].imageUrl,
                        text: news[5].title,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: ' Todays\'s New .. ',
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontsize: 20,
                        ),
                        MyText(
                          text: 'See all ',
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  StaggeredGridView.countBuilder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: news.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    staggeredTileBuilder: (i) => const StaggeredTile.fit(1),
                    itemBuilder: (context, i) {
                      return Hero(
                        tag: news[i],
                        child: GestureDetector(
                          onTap: () {
                            Get.to(
                              transition: Transition.cupertino,
                              () => DetailsView(
                                id: news[i],
                                headerText: news[i].title,
                                contentText: news[i].description,
                                img: news[i].imageUrl,
                                catTitle: controller.myText[0],
                              ),
                            );
                          },
                          child: NewsCard(
                            img: '${news[i].imageUrl}',
                            text: news[i].title,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
