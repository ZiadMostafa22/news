import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/api/model/source_response/source.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/categories/widgets/source_item_widget.dart';

import '../../articles_list_widget/articles_list_widget.dart';

class SourcesTabWidget extends StatefulWidget {
   SourcesTabWidget({super.key , required this.sources});

  List <Source> sources ;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length , child:TabBar(
          onTap: (index) {
            tappedIndex = index;
            setState(() {

            });
          },
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          tabs: widget.sources.map( (sources) => SourceItemWidget(source: sources , isSelected: widget.sources.indexOf(sources)==tappedIndex,),).toList()
        ),
        ),

        ArticlesListWidget(source:widget.sources[tappedIndex] ,)

      ],
    );
  }
}


