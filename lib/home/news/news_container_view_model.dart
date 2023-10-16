import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_mon/api/api_manger.dart';
import 'package:flutter_app_news_c9_mon/model/NewsResponse.dart';

class NewsContainerViewModel extends ChangeNotifier{
  /// hold data - handle logic
  List<News>? newsList ;
  String? errorMessage ;
  void getNewsBySourceId(String sourceId)async{
    newsList = null ;
    errorMessage = null ;
    notifyListeners();
    try{
      var response = await ApiManger.getNewsBySourceId(sourceId);
      if(response.status == 'error'){
        errorMessage = response.message ;
      }else{
        newsList = response.articles ;
      }
    }catch(e){
      errorMessage = 'Error Loading News List';
    }
    notifyListeners();
  }
}