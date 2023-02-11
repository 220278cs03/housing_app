import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  Style._();

  //------------------------ BottomNavigationBar style -------------------------//

  static const selectedGradientBottomNav =
      LinearGradient(colors: [Color(0xff6499FF), Color(0xff2972FE)]);
  static const unselectedGradientBottomNav =
      LinearGradient(colors: [Color(0x102972FE), Color(0x102972FE)]);
  static const unselectedBottomIcon = Color(0xff2972FE);
  static const borderBottomNav = Color(0xffEBEEF2);

  //------------------------ MainStyle -----------------------------------------//

  static const whiteColor = Color(0xffFFFFFF);
  static const blackColor = Color(0xff09101D);
  static const primaryBlue = Color(0xff2972FE);

  //------------------------ CategoryStyle -------------------------------------//

  static const bgCategory = Color(0x102972FE);
  static const borderCategory = Color(0xffEBEEF2);

  //----------------------- SearchStyle ----------------------------------------//

  static const searchBgColor = Color(0xffF4F6F9);
  static const searchIconColor = Color(0xff858C94);

  //----------------------- TextColor ------------------------------------------//

  static const titleTextColor = Color(0xff2C3A4B);
  static const ratingTextColor = Color(0xff394452);

  //----------------------- TextStyle ------------------------------------------//

  static textStyleThin({
    double size = 14,
    Color textColor = blackColor,
  }) {
    return GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w400, color: textColor, fontSize: size);
  }

  static textStyleRegular({
    double size = 14,
    Color textColor = blackColor,
  }) {
    return GoogleFonts.sourceSansPro(
        fontWeight: FontWeight.w600, color: textColor, fontSize: size);
  }
}
