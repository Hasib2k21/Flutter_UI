import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/state_holders/bottom_navbar_bloc.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => BottomNavbarBloc(),
        child: const BottomNavScreen(),
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
    return BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
      builder: (context, state) {
        final selectedIndex = (state as TabSelectedState).selectedIndex;

        return Scaffold(
          body: _screens[selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              BlocProvider.of<BottomNavbarBloc>(context).add(SelectTabEvent(index));
            },
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.category_outlined), label: 'Category'),
              NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              NavigationDestination(icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
            ],
          ),
        );
      },
    );
  }
}
