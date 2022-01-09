import 'package:css/models/cart_models.dart';
import 'package:css/models/product_models.dart';
import 'package:css/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/cart_models.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        ),
        ChangeNotifierProvider<CartDataProvider>(
          create: (context) => CartDataProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'ООО "Центростальстрой"',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          backgroundColor: Colors.black,
          textTheme: GoogleFonts.marmeladTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
