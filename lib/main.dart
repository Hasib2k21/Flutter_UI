import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// Product Model
class Product {
  final String name;
  final double price;
  final double discountPrice;
  final String imageUrl;
  final double rating;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });
}

// Sample Product Data
List<Product> products = [
  Product(
    name: "Product 1",
    price: 100.0,
    discountPrice: 80.0,
    imageUrl: "https://via.placeholder.com/150",
    rating: 4.5,
    description: "This is product 1 description.",
  ),
  Product(
    name: "Product 2",
    price: 120.0,
    discountPrice: 100.0,
    imageUrl: "https://via.placeholder.com/150",
    rating: 4.0,
    description: "This is product 2 description.",
  ),
  Product(
    name: "Product 3",
    price: 150.0,
    discountPrice: 130.0,
    imageUrl: "https://via.placeholder.com/150",
    rating: 4.0,
    description: "This is product 3 description.",
  ),
  Product(
    name: "Product 4",
    price: 180.0,
    discountPrice: 150.0,
    imageUrl: "https://via.placeholder.com/150",
    rating: 4.0,
    description: "This is product 4 description.",
  ),
];

// Cart Management (Global cart)
Map<Product, int> cartItems = {};

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Commerce Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl, height: 120, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("\$${product.price}", style: TextStyle(fontSize: 14, decoration: TextDecoration.lineThrough)),
                  Text("\$${product.discountPrice}", style: TextStyle(fontSize: 16, color: Colors.red)),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: index < product.rating.toInt() ? Colors.yellow : Colors.grey,
                        size: 14,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product.imageUrl, height: 200, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("\$${product.price}", style: TextStyle(fontSize: 18, decoration: TextDecoration.lineThrough)),
                  Text("\$${product.discountPrice}", style: TextStyle(fontSize: 22, color: Colors.red)),
                  SizedBox(height: 10),
                  Text(product.description),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                addToCart(product);
                Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }

  // Adds the product to the global cart
  void addToCart(Product product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
    }
  }
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double get totalPrice {
    return cartItems.entries.fold(0.0, (sum, entry) {
      return sum + (entry.key.discountPrice * entry.value);
    });
  }

  void incrementQuantity(Product product) {
    setState(() {
      cartItems[product] = cartItems[product]! + 1;
    });
  }

  void decrementQuantity(Product product) {
    setState(() {
      if (cartItems[product]! > 1) {
        cartItems[product] = cartItems[product]! - 1;
      } else {
        cartItems.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Cart")),
      body: cartItems.isEmpty
          ? Center(child: Text("No items in your cart"))
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems.keys.elementAt(index);
                return ListTile(
                  leading: Image.network(product.imageUrl),
                  title: Text(product.name),
                  subtitle: Text("\$${product.discountPrice}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          decrementQuantity(product);
                        },
                      ),
                      Text('${cartItems[product]}'),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          incrementQuantity(product);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: \$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle payment action
                  },
                  child: Text("Pay Now"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
