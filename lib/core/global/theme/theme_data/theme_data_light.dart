import 'package:flutter/material.dart';

import '../app_color/app_color_light.dart';

ThemeData getThemeDataLight () => ThemeData.light().copyWith(
    scaffoldBackgroundColor:AppColorLight.appColor,
    brightness: Brightness.light,
    cardColor:Colors.black,
    backgroundColor:Colors.black,
    accentColor:Colors.black,
    colorScheme:const ColorScheme.light(),
    primaryColor:Colors.black ,
    canvasColor:Colors.black,

    // primaryColorBrightness:Colors.black45,
    // textTheme:const TextTheme(
    //   titleMedium: TextStyle(color: Colors.black87,backgroundColor:Colors.black12),
    //   titleSmall: TextStyle(color: Colors.black87,backgroundColor:Colors.black12),
    //   titleLarge: TextStyle(color: Colors.black87,backgroundColor:Colors.black12),
    // ),
    
    iconTheme: const IconThemeData(
      
      color:Colors.black,
      fill:.8
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          // elevation: MaterialStateProperty.all(0),
          foregroundColor:
              MaterialStateProperty.all(Colors.black),
          animationDuration: const Duration(milliseconds: 3),
          // minimumSize:const MaterialStatePropertyAll(Size(50, 30)),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    appBarTheme: AppBarTheme(backgroundColor:Color.fromARGB(220, 230, 223, 223).withOpacity(.9),
     textTheme:const TextTheme(
        titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
    ),
    elevation:0,
    foregroundColor: Colors.black,
    iconTheme:const IconThemeData(color:Colors.black,
    opacity:.8),
   
    ),
     switchTheme:SwitchThemeData(
      trackColor:MaterialStateProperty.all(Colors.grey.shade800),
      thumbColor:MaterialStateProperty.all(Colors.grey.shade600),
    ),
  );