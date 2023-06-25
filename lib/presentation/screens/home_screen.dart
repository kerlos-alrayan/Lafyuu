import 'package:ecommerce_app_sat26/presentation/screens/account_screen.dart';
import 'package:ecommerce_app_sat26/presentation/screens/cart_screen.dart';
import 'package:ecommerce_app_sat26/presentation/screens/explore_screen.dart';
import 'package:ecommerce_app_sat26/presentation/screens/main_screen.dart';
import 'package:ecommerce_app_sat26/presentation/screens/offer_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;
  List _screen =[
    // Main Screen
    MainScreen(),

    // Explore Screen
    ExploreScreen(),

    // Cart Screen
    CartScreen(),

    // Offer Screen
    OfferScreen(),

    // Account Screen
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: screenIndex,
        onTap: (int index){
         setState(() {
           screenIndex = index; //[0, 1, 2, 3, 4]
         });
        },
        type: BottomNavigationBarType.fixed, // lw akter mn 2 icons
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer_outlined,
            ),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
            ),
            label: 'Account',
          ),
        ],
      ),
      body: _screen[screenIndex], //[0, 1, 2, 3, 4]
    );
  }
}
