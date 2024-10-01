import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/cart_view_model.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: ListView.builder(
        itemCount: cartViewModel.cartItems.length,
        itemBuilder: (context, index) {
          final product = cartViewModel.cartItems[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                cartViewModel.removeFromCart(product);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total: \$${cartViewModel.getTotalPrice()}'),
            ElevatedButton(
              onPressed: () {
                // Checkout functionality
              },
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
