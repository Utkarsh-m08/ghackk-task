import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ghackk/styles/screen_utils.dart';
import 'package:ghackk/styles/style.dart';
import 'package:ghackk/ui/screens/favourite/manage_fav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final String webtoonTitle;
  final String imageUrl;

  DetailScreen({required this.webtoonTitle, required this.imageUrl});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double userRating = 0.0;
  double averageRating = 0.0;

  @override
  void initState() {
    super.initState();
    _loadRating();
  }

  void _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double savedRating = prefs.getDouble(widget.webtoonTitle) ?? 0.0;
    setState(() {
      averageRating =
          savedRating; // For simplicity, we'll use a single rating per webtoon
    });
  }

  void _saveRating(double rating) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(widget.webtoonTitle, rating);
    setState(() {
      userRating = rating;
      averageRating = rating; // Simulating average rating calculation here
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtils(context);
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors().primaryColour.withOpacity(0.15),
              AppColors().primaryColour.withOpacity(1.0),
            ],
          ),
        ),
        height: screenUtil.responsiveHeight(0.7),
        // width: screenUtil.responsiveWidth(0.9),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(widget.imageUrl),
              SizedBox(height: screenUtil.responsiveHeight(0.02)),
              Text(
                'Description of ${widget.webtoonTitle}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: screenUtil.responsiveHeight(0.02)),
              Text(
                'This webtoon is highly popular and featured in multiple media outlets, including "Lore Olympus: Jaw Dropping Seen on Media".',
                style: AppTextStyles.body(context, null, null),
              ),
              SizedBox(height: screenUtil.responsiveHeight(0.02)),
              Text(
                'Average Rating: $averageRating',
                style: AppTextStyles.headline(context, null, null, null),
              ),
              SizedBox(height: screenUtil.responsiveHeight(0.02)),
              Text(
                'Rate this Webtoon:',
                style: AppTextStyles.body(
                  context,
                  null,
                  null,
                ),
              ),
              RatingBar.builder(
                initialRating: userRating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    Icon(Icons.star, color: AppColors().accentColour),
                onRatingUpdate: (rating) {
                  _saveRating(rating);
                },
              ),
              SizedBox(height: screenUtil.responsiveHeight(0.02)),
              ElevatedButton(
                onPressed: () async {
                  await FavoritesManager.addFavorite(widget.webtoonTitle);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('${widget.webtoonTitle} added to favorites!')),
                  );
                },
                child: Text(
                  'Add to Favorites',
                  style: AppTextStyles.body(context, null, null),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
