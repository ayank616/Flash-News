// ignore_for_file: unnecessary_null_comparison, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:news_app/cards/news_card.dart';
import 'package:news_app/helper/article_model.dart';
import 'package:news_app/helper/news_model.dart';

class Category_Screen extends StatefulWidget {
  final String category;
  Category_Screen({required this.category});

  @override
  State<Category_Screen> createState() => _Category_ScreenState();
}

class _Category_ScreenState extends State<Category_Screen> {
  List<Article_Model> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getcatNews();
  }

  Future<void> getcatNews() async {
    Cat_News_Model news = Cat_News_Model();
    await news.getCatNews(widget.category);
    articles = news.articles;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("                  "),
            Text('flash'),
            Text(
              'NEWS',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        elevation: 0.2,
        backgroundColor: Colors.transparent,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              child: ListView.builder(
                itemCount: articles.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (articles != null && index < articles.length) {
                    return News_Card(
                      image: articles[index].urlToImage,
                      title: articles[index].title,
                      description: articles[index].description,
                      url: articles[index].url,
                    );
                  } else {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                },
              ),
            ),
    );
  }
}
