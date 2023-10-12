import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_mon/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_mon/home/news/news_container.dart';
import 'package:flutter_app_news_c9_mon/home/tabs/tab_item.dart';

class TabContainer extends StatefulWidget {
  List<Source> sourceList;

  TabContainer({required this.sourceList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourceList
                  .map((source) => TabItem(
                      source: source,
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source)))
                  .toList(),
            ),
            Expanded(child: NewsContainer(source: widget.sourceList[selectedIndex]))
          ],
        ));
  }
}
