// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Article_Screen extends StatefulWidget {
  Article_Screen({required this.newsUrl});
  final String newsUrl;

  @override
  State<Article_Screen> createState() => _Article_ScreenState();
}

class _Article_ScreenState extends State<Article_Screen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(widget.newsUrl),
      );
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
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
