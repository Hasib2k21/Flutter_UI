import '../models/order.dart';
import '../models/product.dart';

class OrderService {
  Future<void> placeOrder(List<Product> products, String userId) async {
    // Simulate placing an order
    await Future.delayed(Duration(seconds: 2));
  }

  Future<List<Order>> getOrders(String userId) async {
    // Simulate fetching orders
    await Future.delayed(Duration(seconds: 2));
    return [
      Order(orderId: '1', userId: userId, products: [], totalPrice: 100.0, orderDate: DateTime.now())
    ];
  }
}
