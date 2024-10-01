import 'product.dart';

class Order {
  final String orderId;
  final String userId;
  final List<Product> products;
  final double totalPrice;
  final DateTime orderDate;

  Order({
    required this.orderId,
    required this.userId,
    required this.products,
    required this.totalPrice,
    required this.orderDate,
  });
}
