import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/articles_response.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/articles_list_widget/article_item_Widget.dart';

class NewSearchDelegate extends SearchDelegate {

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back, color: Colors.white),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchArticle(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: Text('Error loading articles'),
          );
        }

        // Ensure snapshot.data is not null

        var articleResponse = snapshot.data as ArticlesResponse;
        if (articleResponse.articles == null || articleResponse.articles!.isEmpty) {
          return Center(
            child: Text('No articles found'),
          );
        }

        return ListView.builder(
          itemCount: articleResponse.articles!.length?? 0,
          itemBuilder: (context, index) {
            return ArticleItemWidget(article: articleResponse.articles![index]);
          },
        );
      },
    );
  }
}
