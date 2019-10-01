import 'package:flutter/material.dart';
import './category_provider.dart';

class CategoriesProvider with ChangeNotifier {
  final List<CategoryProvider> _categories = [
    CategoryProvider(id: '1', name: 'Vietnam'),
    CategoryProvider(id: '2', name: 'Thailand'),
    CategoryProvider(id: '3', name: 'France'),
    CategoryProvider(id: '4', name: 'England'),
    CategoryProvider(id: '5', name: 'Japan'),
    CategoryProvider(id: '5', name: 'Japan'),
    CategoryProvider(id: '5', name: 'Japan'),
    CategoryProvider(id: '5', name: 'Japan'),
    CategoryProvider(id: '5', name: 'Japan'),
    CategoryProvider(id: '5', name: 'Japan'),
    CategoryProvider(id: '5', name: 'Japan'),
    CategoryProvider(id: '5', name: 'Japan'),
  ];

  bool isFavorite = false;

  List<CategoryProvider> get categories {
    if (isFavorite)
      return _categories.where((e) => e.favorite).toList();
    return _categories;
  }

  CategoryProvider findById(id) =>
      categories.firstWhere((e) => e.id == id, orElse: () => null);

  void toggleFavorite(bool value) {
    isFavorite = value;
    notifyListeners();
  }
}
