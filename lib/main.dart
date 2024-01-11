import 'package:flutter/material.dart';
import 'package:spend/widget/expenses.dart';

// const kColorScheme=ColorScheme(
//     brightness: Brightness.light,
//     primary: Color(0xFFFF6000),
//     onPrimary: Colors.white,
//     secondary: Color(0xFFFFA559),
//     onSecondary: Colors.white,
//     error: Colors.red,
//     onError: Colors.white,
//     background: Color(0xFFE6C7),
//     onBackground: Color(0xFF454545),
//     surface: Color(0xFFE6C7),
//     onSurface: Color(0xFF454545),
//   );

final kColorScheme=ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.onPrimary),
    cardTheme: const CardTheme().copyWith(
      color: kColorScheme.primaryContainer
    ),
    textTheme: ThemeData().textTheme.copyWith(
      bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
        fontSize: 18,
      ) 
    )),
    home: const Expenses(),
    ),
  );
}
