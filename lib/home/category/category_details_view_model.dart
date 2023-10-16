import 'package:flutter/material.dart';
import 'package:flutter_app_news_c9_mon/api/api_manger.dart';
import 'package:flutter_app_news_c9_mon/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  // hold data - handle logic
  List<Source>? sourcesList ;
  String? errorMessage ;
  void getSourceByCategoryId(String categoryId)async{
    sourcesList = null ;
    errorMessage = null ;
    notifyListeners();
    try{
      var response = await ApiManger.getSource(categoryId);
      if(response.status == 'error'){
        errorMessage = response.message ;
      }else{
        sourcesList = response.sources;
      }
    }catch(e){
      errorMessage = 'Error Loading Sources List';
    }
    notifyListeners();
  }
}