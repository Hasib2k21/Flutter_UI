import 'package:flutter/material.dart';

class BottomNavbarProvider with ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void selectCategory() {
    changeIndex(1);
  }

  void backToHome() {
    changeIndex(0);
  }
}
