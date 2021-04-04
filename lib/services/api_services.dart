import 'dart:convert';
import 'package:gsg_final_social/models/news.dart';
import 'package:http/http.dart' as http;



class ApiServices{

  ApiServices._();
  static ApiServices apiServices = ApiServices._();

  static const _apiUrl = 'https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=e22e8681c48f41d4b238127a7d6e7d50' ;

  static const _apiKey = 'e22e8681c48f41d4b238127a7d6e7d50' ;

  static const Map<String , String> _apiHeader = {
    'X-Api-Key' : _apiKey ,
  };

  Future<List<News>> getAllNews()async{
    http.Response response = await http.get(_apiUrl , headers: _apiHeader);
    Map<String, dynamic> mapResponse = jsonDecode(response.body);
    List data = mapResponse['articles'];
    return data.map((e) => News.fromJson(e)).toList();
  }

}