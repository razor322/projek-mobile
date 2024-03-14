import 'package:flutter/material.dart';

class PageGallery extends StatefulWidget {
  const PageGallery({super.key});

  @override
  State<PageGallery> createState() => _PageGalleryState();
}

class _PageGalleryState extends State<PageGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery Movie"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
    );
  }
}
