import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_mon/api/api_manger.dart';
import 'package:flutter_app_news_c9_mon/api/tab_container.dart';
import 'package:flutter_app_news_c9_mon/model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category-details';

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text('News App',
        style: Theme.of(context).textTheme.titleLarge,),
    ),
      body: FutureBuilder<SourceResponse>(
        future: ApiManger.getSource(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            } else if(snapshot.hasError){
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(onPressed: (){
                    ApiManger.getSource();
                    setState(() {

                    });
                  }, child: Text('Try Again'))
                ],
              );
            }
            /// response succuess or error
            if(snapshot.data?.status != 'ok'){
              return Text(snapshot.data?.message??'Something went wrong');
            }
            var sourcesList = snapshot.data?.sources ?? [];
            return TabContainer(sourceList: sourcesList);

          }
      ),
    );
  }
}
