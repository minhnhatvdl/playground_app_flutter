import 'package:flutter/material.dart';
import 'package:flutter_meals_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import './favorite_screen.dart';
import './home_screen.dart';
import '../providers/categories_provider.dart';

enum FilterOptions { Favorite, All }

class TabsBarScreen extends StatefulWidget {
  @override
  _TabsBarScreenState createState() => _TabsBarScreenState();
}

class _TabsBarScreenState extends State<TabsBarScreen> {
  final List<Map<String, Object>> _listTabsBar = [
    {
      'title': 'Category',
      'icon': Icon(Icons.list),
      'item': HomeScreen(),
    },
    {
      'title': 'Favorite',
      'icon': Icon(Icons.favorite),
      'item': FavoriteScreen(),
    }
  ];
  int _indexTabBar = 0;
  void _selectTabBar(int indexTabBar) {
    setState(() {
      _indexTabBar = indexTabBar;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Function toggleFavorite =
        Provider.of<CategoriesProvider>(context).toggleFavorite;
    return Scaffold(
      appBar: AppBar(
        title: Text(_listTabsBar[_indexTabBar]['title']),
        actions: <Widget>[
          Consumer<CartProvider>(
            builder: (ctx, cart, child) => Center(
              child: Badge(
                badgeContent: Text(cart.cartLength.toString(),
                    style: TextStyle(color: Colors.white)),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions value) {
              if (value == FilterOptions.Favorite)
                toggleFavorite(true);
              else if (value == FilterOptions.All) toggleFavorite(false);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favorite'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.All,
              )
            ],
          ),
        ],
      ),
      body: _listTabsBar[_indexTabBar]['item'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexTabBar,
        onTap: _selectTabBar,
        type: BottomNavigationBarType.fixed,
        items: _listTabsBar
            .map((e) => BottomNavigationBarItem(
                  icon: e['icon'],
                  title: Text(e['title']),
                ))
            .toList(),
      ),
    );
  }
}
// BottomNavigationBarItem(
//               icon: Icon(Icons.list), title: Text(_listTabsBar[0]['title'])),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.favorite), title: Text(_listTabsBar[1]['title']))
