import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/product_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productViewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('E-Commerce Home')),
      body: productViewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        itemCount: productViewModel.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final product = productViewModel.products[index];
          return Card(
            child: Column(
              children: [
                Image.network(product.imageUrl, height: 100),
                Text(product.name),
                Text('\$${product.price}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
