// ignore_for_file: non_constant_identifier_names, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:news_app/screens/article_screen.dart';

class News_Card extends StatelessWidget {
  News_Card(
      {required this.image,
      required this.title,
      required this.description,
      required this.url});
  final String image, title, description, url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Article_Screen(newsUrl: url,)));
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                image,
                height: 200,
                width: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
