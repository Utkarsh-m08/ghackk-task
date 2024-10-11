import 'package:flutter/material.dart';
import 'package:ghackk/styles/screen_utils.dart';
import 'package:ghackk/styles/style.dart';
import 'package:ghackk/ui/screens/favourite/manage_fav.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favoriteWebtoons = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() async {
    List<String> favorites = await FavoritesManager.getFavorites();
    setState(() {
      favoriteWebtoons = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtils(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Favourites",
              style: AppTextStyles.headline(
                context,
                50,
                null,
                null,
              ),
            ),
            Container(
              color: AppColors().accentColour,
              height: screenUtil.responsiveHeight(0.008),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors().secondaryColour.withOpacity(0),
              AppColors().primaryColour.withOpacity(1.0),
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: favoriteWebtoons.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                favoriteWebtoons[index],
                style: AppTextStyles.body(
                  context,
                  null,
                  null,
                ),
              ),
              onTap: () {},
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await FavoritesManager.removeFavorite(
                      favoriteWebtoons[index]);
                  _loadFavorites();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
