import '../models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    return [
      Product(id: '1', name: 'Product 1', description: 'Desc 1', price: 29.99, imageUrl: 'https://via.placeholder.com/150'),
      Product(id: '2', name: 'Product 2', description: 'Desc 2', price: 59.99, imageUrl: 'https://via.placeholder.com/150'),
    ];
  }
}
