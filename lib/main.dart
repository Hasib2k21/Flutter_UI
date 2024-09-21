import 'package:flutter/material.dart';
import 'package:practice/state_holders/bottom_navbar_provider.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavbarProvider()),
      ],
      child: MaterialApp(
        title: 'Product App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BottomNavScreen(),
      ),
    );
  }
}

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(text: 'Home',),
    HomeScreen(text: 'Category',),
    HomeScreen(text: 'Cart',),
    HomeScreen(text: 'Favourite',),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavbarProvider = Provider.of<BottomNavbarProvider>(context);

    return Scaffold(
      body: _screens[bottomNavbarProvider.selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: bottomNavbarProvider.selectedIndex,
        onDestinationSelected: (index) => bottomNavbarProvider.changeIndex(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.category_outlined), label: 'Category'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          NavigationDestination(icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
        ],
      ),
    );
  }
}
