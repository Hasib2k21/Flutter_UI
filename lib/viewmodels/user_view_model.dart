import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserViewModel extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> login(String email, String password) async {
    _currentUser = await UserService().login(email, password);
    notifyListeners();
  }

  Future<void> register(String email, String password, String name) async {
    _currentUser = await UserService().register(email, password, name);
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
