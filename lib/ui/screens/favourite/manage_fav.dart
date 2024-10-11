import 'package:shared_preferences/shared_preferences.dart';

class FavoritesManager {
  static const String favoritesKey = 'favorites';

  // get all favss
  static Future<List<String>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favoritesKey) ?? [];
  }

  // add 
  static Future<void> addFavorite(String webtoonTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    if (!favorites.contains(webtoonTitle)) {
      favorites.add(webtoonTitle);
      await prefs.setStringList(favoritesKey, favorites);
    }
  }

  //del
  static Future<void> removeFavorite(String webtoonTitle) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = await getFavorites();
    if (favorites.contains(webtoonTitle)) {
      favorites.remove(webtoonTitle);
      await prefs.setStringList(favoritesKey, favorites);
    }
  }
}
