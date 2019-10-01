import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../providers/cart_provider.dart';
import '../screens/category_screen.dart';

class CategoryItem extends StatelessWidget {
  // final String id;
  // final String name;
  // CategoryItem(this.id, this.name);

  void selectCategory(BuildContext ctx, String id) {
    Navigator.of(ctx).pushNamed(CategoryScreen.routeName, arguments: {
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    final CategoryProvider category =
        Provider.of<CategoryProvider>(context, listen: false);
    final CartProvider cart = Provider.of<CartProvider>(context, listen: false);
    return InkWell(
      onTap: () => selectCategory(context, category.id),
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).primaryColor),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Consumer<CategoryProvider>(
                builder: (ctx, category, child) => GestureDetector(
                    onTap: () => category.toggleFavorite(),
                    child: Icon(
                      category.favorite == true
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                    )),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                  onTap: () => cart.addCart(category),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  )),
            ),
            Center(
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
