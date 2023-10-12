import 'dart:convert';

import 'package:flutter_app_news_c9_mon/api/api_constants.dart';
import 'package:flutter_app_news_c9_mon/model/NewsResponse.dart';
import 'package:flutter_app_news_c9_mon/model/SourceResponse.dart';
import 'package:http/http.dart' as http;
class ApiManger{

  static Future<SourceResponse> getSource()async{
    /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
     */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,{
      'apiKey':'500c5a4f9b244f3db92a47f436f1819e'
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body ;  /// String
      var json = jsonDecode(bodyString);   /// json
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e ;
    }

  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId)async{
    /*
    https://newsapi.org/v2/everything?apiKey=500c5a4f9b244f3db92a47f436f1819e
     */
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
      'apiKey' : '500c5a4f9b244f3db92a47f436f1819e',
      'sources' : sourceId
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body ;
      var json = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e ;
    }
  }
}