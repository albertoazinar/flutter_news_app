import 'package:flutter/material.dart';
import 'package:news_app/models/news_info.dart';
import 'package:news_app/services/api_manager.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  Future<Welcome>? _articleModel;
  @override
  void initState(){
    _articleModel = Api_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child:
              FutureBuilder<Welcome>(
                future: _articleModel,
                builder: (BuildContext context, AsyncSnapshot<Welcome> snapshot) {
                  print(snapshot.data!.articles[0].title);
                  if(snapshot.hasData){
                      itemCount: snapshot.data!.articles.length;
                      return ListView.builder(
                          itemBuilder: (context,index){
                            var article = snapshot.data!.articles[index];
                              return Container(
                                    height: 100,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children:
                                        <Widget>[
                                          Image.network(article.urlToImage),
                                        ],

                                    )
                              );
                      });
                  }else
                    return Center(child: CircularProgressIndicator(),);
                },
              ),
      ),
    );
  }
  
}