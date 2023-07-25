import 'package:ecommerce_app_sat26/cubits/bottom_cubit/bottom_cubit.dart';
import 'package:ecommerce_app_sat26/cubits/home_products_cubit/home_product_cubit.dart';
import 'package:ecommerce_app_sat26/cubits/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce_app_sat26/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomCubit(),
        ),
        BlocProvider(
          create: (context) => HomeProductCubit(),
        ),
        BlocProvider(
          create: (context) => ProductDetailsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
