import 'package:ecommerce_app_sat26/presentation/screens/home_screen.dart';
import 'package:ecommerce_app_sat26/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.data != null){
            print('Its Dooooooooooooooooooooooooooooooooooooon');
            return HomeScreen();
          }else{
            print('Its Noooooooooooooooooooooooot Don');
            return LoginScreen();
          }
        }
    );
  }
}
