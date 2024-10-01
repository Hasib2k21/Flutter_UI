import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/product.dart';
import '../services/order_service.dart';

class OrderViewModel extends ChangeNotifier {
  final OrderService _orderService = OrderService();
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  Future<void> placeOrder(List<Product> products, String userId) async {
    await _orderService.placeOrder(products, userId);
    notifyListeners();
  }

  Future<void> fetchOrders(String userId) async {
    _orders = await _orderService.getOrders(userId);
    notifyListeners();
  }
}
