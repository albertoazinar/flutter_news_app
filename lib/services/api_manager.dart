import 'package:http/http.dart' as http;
import 'package:news_app/constants/strings.dart';

class Api_Manager{

  void getNews() async {
    var client = http.Client();

    var response =  await client.get(Uri.parse(Strings.api_news_url));

    if(response.statusCode == 200){

    }
  }
}