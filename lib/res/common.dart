import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'app_color.dart';

class CommonUtils {
  
  static void hideKeypad(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static ThemeData buildThemeData() {
    const  color = AppColor.primaryColor;
    final colorSwatch = {
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1),
    };

    final materialColor = MaterialColor(
      color.value,
      colorSwatch,
    );
    return ThemeData(primarySwatch: materialColor,
    primaryIconTheme: const IconThemeData.fallback().copyWith(
    color: Colors.white,
  ),
    );
  }


  String getDateToday() {
    final now =  DateTime.now();
    return  DateTime(now.year, now.month, now.day).toString();
  }

  String getDateStr(String raw) {
    return DateFormat('MMMM dd, yyyy').format(DateTime.parse(raw));
  }

  static String getTimeStr(DateTime dateTime) {
    return DateFormat('HH:mm a').format(dateTime);
  }

  String capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();
}
