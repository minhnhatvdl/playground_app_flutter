import 'package:flutter/foundation.dart';

class CategoryProvider with ChangeNotifier {
  final String id;
  final String name;
  bool favorite;
  CategoryProvider({@required this.id, @required this.name, this.favorite = false});

  void toggleFavorite() {
    favorite = !favorite;
    notifyListeners();
  }
}
