import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:news_app/view/widgets/details_view.dart';
import 'package:news_app/view/widgets/news_card.dart';


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
    return Container(
      height: Get.height,
      width: Get.width,
      child: FutureBuilder<List<News>>(
          future: controller.fetchData('business'),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<News> news = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    padding: const EdgeInsets.all(0),
                    itemCount: news.length,
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    staggeredTileBuilder: (i) => const StaggeredTile.fit(1),
                    itemBuilder: (context, i) {
                      return  GestureDetector(
                        onTap: () {
                          Get.to(() => DetailsView(
                                headerText: news[i].title,
                                contentText: news[i].description,
                                img: news[i].imageUrl,
                                catTitle: controller.myText[3],
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
