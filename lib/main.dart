import 'package:flutter/material.dart';
import 'package:practice/views/auth/login_screen.dart';
import 'package:practice/views/cart_screen.dart';
import 'package:provider/provider.dart';
import 'viewmodels/product_view_model.dart';
import 'viewmodels/cart_view_model.dart';
import 'viewmodels/user_view_model.dart';
import 'views/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
