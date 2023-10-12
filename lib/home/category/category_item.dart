import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_mon/model/category.dart';

class CategoryItem extends StatelessWidget {
  Category category ;
  int index ;
  CategoryItem({required this.category,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(index%2==0 ? 24  :0),
          bottomRight: Radius.circular(index%2 ==0 ? 0 : 24)
        )
      ),
      child: Column(
        children: [
          Image.asset(category.imageUrl,
          height: MediaQuery.of(context).size.height*0.15,),
          Text(category.title,
          style: Theme.of(context).textTheme.titleLarge,),
        ],
      ),
    );
  }
}
