import 'package:flutter/widgets.dart';

class ScreenUtils {
  
  final BuildContext context;

  ScreenUtils(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;
  
   // responsive width
  double responsiveWidth(double percentage) {
    return screenWidth * percentage;
  }

  // responsive height
  double responsiveHeight(double percentage) {
    return screenHeight * percentage;
  }

  // font size based on screen size
  double responsiveFontSize(double percentage) {
    return screenWidth * percentage;
  }

  //  different screen sizes
  bool get isSmallScreen => screenWidth < 600;
  bool get isMediumScreen => screenWidth >= 600 && screenWidth < 1024;
  bool get isLargeScreen => screenWidth >= 1024;
}
