import 'package:flutter/material.dart';
import 'styles.dart';

final ThemeData themeData = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: primaryColor,
  accentColor: primaryColor,
  canvasColor: Colors.white,
  dividerColor: Colors.grey,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.white,
    brightness: Brightness.light,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
  ),
  // buttonTheme: ButtonThemeData(
  //   buttonColor: PrimaryRed,
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(10),
  //   ),
  // ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
            (_) => primaryColor,
      ),
    ),
  ),
  buttonColor: primaryColor,
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 300,
    height: 48,
    buttonColor: primaryColor,
    padding: EdgeInsets.only(left: 20, right: 20),
    shape: RoundedRectangleBorder(
      // side: BorderSide(
      //   color: Colors.white,
      //   width: 1,
      //   style: BorderStyle.solid,
      // ),
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(vertical: 10),
    focusColor: primaryColor,
    hintStyle: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.black.withOpacity(0.45),
      fontWeight: FontWeight.w500,
    ),
    // fillColor: Color(0xffF4F5F7),
    // filled: true,
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(5),
    //   gapPadding: 10,
    //   borderSide: BorderSide.none,
    // ),
  ),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  }),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    backgroundColor: primaryColor,
    contentTextStyle: TextStyle(
      fontFamily: 'Poppins',
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
