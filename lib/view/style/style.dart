import 'package:flutter/cupertino.dart';

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
}
