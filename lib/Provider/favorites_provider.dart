import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void addOrRemoveFavorite(String id) {
    if (isElementInFavorite(id)) {
      removeFavorite(id);
    } else {
      _favorites.add(id);
    }
    notifyListeners();
  }

  bool isElementInFavorite(String id) {
    return _favorites.contains(id);
  }

  void removeFavorite(String id) {
    _favorites.removeWhere((favorite) => favorite == id);
  }
}