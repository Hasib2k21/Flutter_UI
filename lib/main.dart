import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Widget/product_image.dart';

import 'Widget/utilies.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailsScreen(),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = demoProducts[0];
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      body: ListView(
        children: [
          ProductImages(product: product),
        ],
      ),

    );
  }

}








