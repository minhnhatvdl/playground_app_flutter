import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/categories_provider.dart';
import './providers/cart_provider.dart';
import './screens/tabsbar_screen.dart';
import './screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CategoriesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        )
      ],
      child: MaterialApp(
        home: TabsBarScreen(),
        routes: {CategoryScreen.routeName: (_) => CategoryScreen()},
        theme: ThemeData(
            primarySwatch: Colors.green,
            accentColor: Colors.grey,
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
    );
  }
}
