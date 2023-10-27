import 'package:flutter/material.dart';

import '../app_color/app_color_dark.dart';


  ThemeData getThemeDataDark () => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColorDark.appColor,
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    colorScheme:const ColorScheme.dark(),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
     iconTheme: const IconThemeData(
      opacity: .8,
      color:Colors.black87,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          // elevation: MaterialStateProperty.all(0),
          foregroundColor:
              MaterialStateProperty.all(Colors.white),
          animationDuration: const Duration(milliseconds: 3),
          // minimumSize:const MaterialStatePropertyAll(Size(50, 30)),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
     appBarTheme: AppBarTheme(backgroundColor:AppColorDark.appColor.withOpacity(.9),
    // titleTextStyle:TextStyle(color: Colors.white10) ,
     iconTheme:const IconThemeData(color:Colors.white,
    opacity:.8),
    textTheme:const TextTheme(
        titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
    elevation:0,
    foregroundColor:Colors.white,
    ),
    switchTheme:SwitchThemeData(
      trackColor:MaterialStateProperty.all(Colors.white70),
      thumbColor:MaterialStateProperty.all(Colors.white30),
    ),
  );


