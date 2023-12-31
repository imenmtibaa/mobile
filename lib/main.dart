import 'package:flutter/material.dart';
import 'package:projet/categories_screen.dart';
import 'package:projet/category_screen.dart';
import 'package:projet/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/categories': (context) => const CategoriesScreen(),
        '/category': (context) => const CategoryScreen(),
      }
    );
  }
}
