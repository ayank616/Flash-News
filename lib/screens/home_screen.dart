// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:news_app/cards/category_cards.dart';
import 'package:news_app/cards/news_card.dart';
import 'package:news_app/helper/article_model.dart';
import 'package:news_app/helper/news_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article_Model> articles = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    News_Model news = News_Model();
    await news.getNews();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('flash'),
            Text(
              'NEWS',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        elevation: 0.2,
        backgroundColor: Colors.transparent,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Column(
                children: [
                  ///CATEGORIES///
                  Categories(),

                  const Padding(padding: EdgeInsets.all(5)),

                  ///ARTICLES///
                  Expanded(
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
                  )),
                ],
              ),
            ),
    );
  }
}
