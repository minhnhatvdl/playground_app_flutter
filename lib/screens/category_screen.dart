import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categories_provider.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = 'category_screen';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = arguments['id'];
    final selectedCategory =
        Provider.of<CategoriesProvider>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory.name),
      ),
      body: Container(
        child: Text(id),
      ),
    );
  }
}
