import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/data/api/model/source_response/source.dart';
import 'package:news_app_c12_online_sun/data_model/category_DM.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/categories_details/widgets/sources_tab_widget.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryDM.backEndId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          //hasError Returns true if i cannot access to the server
          // if snapshot.data returns no nullable (access the server and collect data but the status is error :

          return Text(snapshot.data?.message ??
              'Check Connection'); // message shows when error happen
        }

        List<Source> sources =
            snapshot.data?.sources ?? []; // the list cannot be null
        return SourcesTabWidget(sources: sources,);
      },
    );
  }
}
