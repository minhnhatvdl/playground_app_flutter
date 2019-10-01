import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './category_item.dart';
import '../providers/categories_provider.dart';

class ListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesProvider>(context).categories;
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
            // builder: (_) => categories[i],
            value: categories[i],
            child: CategoryItem()),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
// GridView(
//   children: categories.map((e) => CategoryItem(e.id, e.name)).toList(),
//   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//     maxCrossAxisExtent: 200,
//     childAspectRatio: 1.5,
//     crossAxisSpacing: 10,
//     mainAxisSpacing: 10,
//   ),
// )
