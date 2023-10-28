// ignore_for_file: camel_case_types, avoid_print

import 'dart:convert';
import 'package:news_app/helper/article_model.dart';
import 'package:http/http.dart' as http;

const String apiKey = '&apiKey=5017ace57ad74cf4affe69ecbad52eae';
const String newsApi = 'https://newsapi.org/v2/top-headlines?country=us';
const String catNewsApi = '$newsApi&category=';

class News_Model {
  List<Article_Model> articles = [];

  Future<void> getNews() async {
    var response = await http.get(Uri.parse('$newsApi$apiKey'));

    var json = jsonDecode(response.body);

    if (json['status'] == 'ok') {
      json['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article_Model articlemodel = Article_Model(
              title: element['title'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              url: element['url']);

          articles.add(articlemodel);
        }
      });
    }
  }
}

class Cat_News_Model {
  List<Article_Model> articles = [];

  Future<void> getCatNews(String category) async {
    var response = await http.get(Uri.parse(
        '$catNewsApi$category&apiKey=5017ace57ad74cf4affe69ecbad52eae'));

    var json = jsonDecode(response.body);

    if (json['status'] == 'ok') {
      json['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article_Model articlemodel = Article_Model(
              title: element['title'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              url: element['url']);

          articles.add(articlemodel);
        }
      });
    }
  }
}
