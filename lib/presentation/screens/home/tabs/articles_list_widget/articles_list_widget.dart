import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/articles_list_widget/article_item_Widget.dart';

import '../../../../../data/api/model/source_response/source.dart';

class ArticlesListWidget extends StatelessWidget {
  ArticlesListWidget({super.key, required this.source});

  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError)
          {
            return Text(snapshot.data?.message ?? 'Check Internet Connection');
          }
        List <Article> articles = snapshot.data!.articles!;
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ArticleItemWidget(article: articles[index]),
            itemCount: articles.length,
          ),
        );
      },);

  }


}
