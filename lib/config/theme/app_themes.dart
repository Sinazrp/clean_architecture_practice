import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Muli',
  appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 134, 133, 133),
      ),
      titleTextStyle: TextStyle(color: Colors.grey, fontSize: 18)),
);
