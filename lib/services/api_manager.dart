import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/strings.dart';
import 'package:news_app/models/news_info.dart';

class Api_Manager{

  Future<Article> getNews() async {
    var client = http.Client();
    var articleModel = null;
    try {
      var response = await client.get(Uri.parse(Strings.api_news_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        articleModel = Article.fromJson(jsonMap);
      }
    }catch(err){
      return articleModel;
    }
    return articleModel;
  }
}