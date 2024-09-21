import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/state_holders/bottom_navbar_controller.dart';
import 'controller_binder.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavScreen(),
      initialBinding: ControllerBinders(),
    );
  }
}

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final BottomNavbarController _navbarController =
  Get.find<BottomNavbarController>();

  final List<Widget> _screen = [
    const HomeScreen(text: 'Home',),
    const HomeScreen(text: 'Category',),
    const HomeScreen(text: 'Cart',),
    const HomeScreen(text: 'Favourites',),

  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(
        builder: (_) {
          return Scaffold(
            body: _screen[_navbarController.selectedIndex],
            bottomNavigationBar: NavigationBar(
              selectedIndex: _navbarController.selectedIndex,
              onDestinationSelected: _navbarController.changeIndex,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.category_outlined), label: 'Category'),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
                NavigationDestination(
                    icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
              ],
            ),
          );
        }
    );
  }
}

