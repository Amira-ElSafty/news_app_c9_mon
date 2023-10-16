import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_mon/api/api_manger.dart';
import 'package:flutter_app_news_c9_mon/home/category/category_details_view_model.dart';
import 'package:flutter_app_news_c9_mon/home/tabs/tab_container.dart';
import 'package:flutter_app_news_c9_mon/model/SourceResponse.dart';
import 'package:flutter_app_news_c9_mon/model/category.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'Category-details';
  Category category ;
  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategoryId(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
        create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
          builder: (context,viewModel,child){
            if(viewModel.errorMessage != null){
              return Column(
                children: [
                  Text(viewModel.errorMessage!),
                  ElevatedButton(onPressed: (){
                    viewModel.getSourceByCategoryId(widget.category.id);
                  }, child: Text('Try Again'))
                ],
              );
            }
            if(viewModel.sourcesList == null){
              return Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              );
            }else{
              return TabContainer(sourceList: viewModel.sourcesList!);
            }
          }
      ),
    );

    //   FutureBuilder<SourceResponse>(
    //     future: ApiManger.getSource(widget.category.id),
    //       builder: (context, snapshot) {
    //         if(snapshot.connectionState == ConnectionState.waiting){
    //           return Center(
    //             child: CircularProgressIndicator(
    //               color: Theme.of(context).primaryColor,
    //             ),
    //           );
    //         } else if(snapshot.hasError){
    //           return Column(
    //             children: [
    //               Text('Something went wrong'),
    //               ElevatedButton(onPressed: (){
    //                 ApiManger.getSource(widget.category.id);
    //                 setState(() {
    //
    //                 });
    //               }, child: Text('Try Again'))
    //             ],
    //           );
    //         }
    //         /// response succuess or error
    //         if(snapshot.data?.status != 'ok'){
    //           return Text(snapshot.data?.message??'Something went wrong');
    //         }
    //         var sourcesList = snapshot.data?.sources ?? [];
    //         return TabContainer(sourceList: sourcesList);
    //
    //       }
    //
    // );
  }
}
