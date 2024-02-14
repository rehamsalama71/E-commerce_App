import 'package:ecommerce/provider/cart_provider.dart';
import 'package:ecommerce/provider/favorite_provider.dart';
import 'package:ecommerce/screens/cart_screen_details.dart';
import 'package:ecommerce/screens/favourite_page.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login_page.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => FavoriteProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorSchemeSeed: Color.fromARGB(255, 121, 65, 44),
              scaffoldBackgroundColor: Colors.grey.shade100,
            ),
            home: const LoginScreen(),
          ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List screens = [
    const HomeScreen(),
    const FavoriteScreen(),
          ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E - Commerce Shop'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartDetails(),
                    ),
                  ),
              icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() => currentIndex = value);
          },
          selectedItemColor: Color.fromARGB(255, 121, 65, 44),
          unselectedItemColor: Color.fromARGB(255, 197, 195, 195),
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Favorite",
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}