import 'package:flutter/material.dart';
import 'package:ghackk/styles/screen_utils.dart';
import 'package:ghackk/styles/style.dart';
import 'package:ghackk/ui/screens/home/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> webtoonCategories = [
    {
      'title': 'Lore Olympus',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123040-750x375.webp'
    },
    {
      'title': 'Hello Baby',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123400-750x375.webp'
    },
    {
      'title': 'The Alpha Kings Claim',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-123842-750x375.webp'
    },
    {
      'title': 'Bitten Contract',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-125252-750x375.webp'
    },
    {
      'title': 'Tricked into Becoming the Heroines Stepmother',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-134227-750x375.webp'
    },
    {
      'title': 'The Guy Upstairs',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/08/Screenshot-2024-05-28-192655-e1723318535608-750x375.png'
    },
    {
      'title': 'The Runaway',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/08/Screenshot-2024-08-11-011235-750x375.png'
    },
    {
      'title': 'Your Smile Is A Trap',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-132459-750x375.webp'
    },
    {
      'title': 'There Must Be Happy Endings',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-133040-750x375.webp'
    },
    {
      'title': 'Seasons of Blossom',
      'thumbnail':
          'https://animemangatoon.com/wp-content/uploads/2024/09/Screenshot-2024-09-16-133857-750x375.webp'
    },

    // Add more categories...
  ];

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtils(context);
    return Scaffold(
      backgroundColor: AppColors().backgroundColour,
      body: Padding(
        padding: EdgeInsets.all(screenUtil.responsiveWidth(0.03)),
        child: Column(
          children: [
            SizedBox(
              height: screenUtil.responsiveHeight(0.08),
            ),
            Row(
              children: [
                Text(
                  "Popular",
                  style: AppTextStyles.headline(
                    context,
                    50,
                    null,
                    0.4,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Webtoons",
                  style: AppTextStyles.headlineItalics(
                    context,
                    60,
                    AppColors().primaryColour,
                    null,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenUtil.responsiveHeight(0.01),
            ),
            Container(
              color: AppColors().accentColour,
              height: screenUtil.responsiveHeight(0.008),
            ),
            SizedBox(
              height: screenUtil.responsiveHeight(0.01),
            ),
            Row(
              children: [
                Text(
                  "Top 10!",
                  style: AppTextStyles.headline(
                    context,
                    30,
                    AppColors().primaryColour,
                    null,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenUtil.responsiveHeight(0.01),
            ),
            SizedBox(
              // decoration: BoxDecoration(),
              height: screenUtil.responsiveHeight(0.619),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: webtoonCategories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        DialogRoute(
                          context: context,
                          builder: (context) => DetailScreen(
                            webtoonTitle: webtoonCategories[index]['title']!,
                            imageUrl: webtoonCategories[index]['thumbnail']!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: AppColors().primaryColour,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Thumbnail Image
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.network(
                              webtoonCategories[index]['thumbnail']!,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    'assets/placeholder_image.png',
                                    width: screenUtil.responsiveWidth(0.7),
                                    height: screenUtil.responsiveHeight(0.4));
                              },
                              height: screenUtil.responsiveHeight(0.3),
                              width: screenUtil.responsiveWidth(1),
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              webtoonCategories[index]['title']!,
                              style: AppTextStyles.body(context, null, null),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
