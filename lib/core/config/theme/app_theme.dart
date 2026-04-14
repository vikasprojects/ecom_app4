// import 'package:ecom_app4/core/ocnfig/theme/app_color.dart';
// import 'package:flutter/material.dart';

// class AppTheme {
//   static final appTheme = ThemeData(
//     primaryColor: AppColor.primary,
//     scaffoldBackgroundColor: AppColor.background,
//     brightness: Brightness.dark,
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: AppColor.secondaryBackground,
//       hintStyle: TextStyle(
//         color: Color(0xffA7A7A7),
//         fontWeight: FontWeight.bold
//       ),
//       contentPadding: EdgeInsets.all(12),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30),
//         borderSide: BorderSide.none
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30),
//         borderSide: BorderSide.none
//       ),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColor.primary,
//         elevation: 0,
//         textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12)
//         )
//       )
//     )
//   );
// }


import 'package:ecom_app4/core/config/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final appTheme = ThemeData(
    primaryColor: AppColor.primary,
    scaffoldBackgroundColor: AppColor.background,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationThemeData(
      filled: true,
      fillColor: AppColor.secondaryBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none
      ),
      hintStyle: TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.bold
      ),
      contentPadding: EdgeInsets.all(20)
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        elevation: 0,
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        )
      )
    )
  );
}