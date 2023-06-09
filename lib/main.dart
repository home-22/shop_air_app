import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_air_app/providers/card_provider.dart';
import 'package:shop_air_app/providers/product_search_provider.dart';
import 'package:shop_air_app/screens/welcome_screen/welcome_screen.dart';

void main()
//async
{
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductSearchProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Shop ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
