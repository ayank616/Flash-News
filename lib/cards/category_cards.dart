// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/screens/category_screen.dart';

class Category_Card extends StatelessWidget {
  Category_Card({required this.image, required this.category});
  final String image, category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 10, bottom: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Category_Screen(
                category: category.toLowerCase(),
              ),
            ),
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: image,
                height: 50,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                height: 50,
                width: 110,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.black45,
                ),
                child: Center(child: Text(category))),
          ],
        ),
      ),
    );
  }
}

SingleChildScrollView Categories() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Category_Card(
          image:
              'https://img.etimg.com/thumb/msid-103850183,width-1200,height-900,resizemode-4,imgsize-98920/india-canada-diplomatic-ties-live-news-khalistani-terrorist-hardeep-singh-nijjar-killing-row-justin-trudeau-canada-visa-latest-updates.jpg',
          category: 'General',
        ),
        Category_Card(
          image:
              'https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?auto=format&fit=crop&q=80&w=1456&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          category: 'Entertainment',
        ),
        Category_Card(
          image:
              'https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format&fit=crop&q=80&w=1471&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          category: 'Business',
        ),
        Category_Card(
          image:
              'https://images.unsplash.com/photo-1624526267942-ab0ff8a3e972?auto=format&fit=crop&q=80&w=1470&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          category: 'Sports',
        ),
        Category_Card(
          image:
              'https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          category: 'Technology',
        ),
        Category_Card(
          image:
              'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?auto=format&fit=crop&q=80&w=1032&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          category: 'Health',
        ),
      ],
    ),
  );
}
