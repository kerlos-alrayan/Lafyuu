import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final String title;
  final String imageURL;

  const CategoryScreen({ required this.title, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
