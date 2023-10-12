import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_mon/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_mon/my_theme.dart';

class TabItem extends StatelessWidget {
  Source source ;
  bool isSelected ;
  TabItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent ,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 3
        ),
      ),
      child: Text(source.name ?? '',
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color:  isSelected ? MyTheme.whiteColor : Theme.of(context).primaryColor
        ),
      ),
    );
  }
}
