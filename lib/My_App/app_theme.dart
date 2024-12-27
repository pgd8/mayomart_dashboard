import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color mainColor = Color(0xffff0000);
  static const Color secondColor = Colors.black;
  static const Color thirdColor = Colors.white;
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: thirdColor,
    appBarTheme: const AppBarTheme(backgroundColor: thirdColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(color: AppTheme.mainColor),
      unselectedIconTheme: IconThemeData(color: Colors.grey),
      type: BottomNavigationBarType.shifting,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp))),
    searchBarTheme: SearchBarThemeData(
      textStyle: WidgetStatePropertyAll(TextStyle(
        fontSize: 14.sp,
        color: secondColor,
        fontFamily: "childos",
      )),
      shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      )),
      backgroundColor: const WidgetStatePropertyAll(thirdColor),
      hintStyle: WidgetStatePropertyAll(TextStyle(
        fontSize: 25.sp,
        color: Colors.grey,
        fontFamily: "childos",
      )),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: Colors.black)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: Colors.black)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: Colors.black)),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    hintColor: Colors.grey,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: thirdColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: thirdColor)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.r),
        borderSide: const BorderSide(color: mainColor),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: thirdColor)),
    ),
    scaffoldBackgroundColor: secondColor,
    appBarTheme: const AppBarTheme(color: secondColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(color: AppTheme.mainColor),
      unselectedIconTheme: IconThemeData(color: Colors.grey),
      type: BottomNavigationBarType.shifting,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp))),
    searchBarTheme: SearchBarThemeData(
      textStyle: WidgetStatePropertyAll(TextStyle(
        fontSize: 14.sp,
        color: secondColor,
        fontFamily: "childos",
      )),
      shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      )),
      backgroundColor: const WidgetStatePropertyAll(thirdColor),
      hintStyle: WidgetStatePropertyAll(TextStyle(
        fontSize: 25.sp,
        color: Colors.grey,
        fontFamily: "childos",
      )),
    ),
  );
}
