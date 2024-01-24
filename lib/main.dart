import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

final kColorScheme=ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
final kDarkColorScheme=ColorScheme.fromSeed(brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp
  // ]).then((fn){

  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kDarkColorScheme.onPrimary,
      foregroundColor: kDarkColorScheme.onPrimaryContainer),
      cardTheme: const CardTheme().copyWith(
      color: kDarkColorScheme.primaryContainer),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      backgroundColor: kDarkColorScheme.primaryContainer,
      foregroundColor: kDarkColorScheme.onPrimaryContainer
    )),
    textTheme: ThemeData().textTheme.copyWith(
      bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
        color: kDarkColorScheme.onPrimaryContainer,
        fontSize: 18,
      ) ,)
      
    // dropdownMenuTheme: DropdownMenuThemeData(
    //   textStyle: TextStyle(
    //       color: kDarkColorScheme.onPrimaryContainer

    //   ),
    //   inputDecorationTheme: InputDecorationTheme()
    // )

    ),



    theme: ThemeData().copyWith(colorScheme: kColorScheme,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: kColorScheme.onPrimaryContainer,
      foregroundColor: kColorScheme.onPrimary),
    cardTheme: const CardTheme().copyWith(
      color: kColorScheme.primaryContainer
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      backgroundColor: kColorScheme.primaryContainer
    )),
    textTheme: ThemeData().textTheme.copyWith(
      bodyMedium: ThemeData().textTheme.bodyMedium!.copyWith(
        fontSize: 18,
      ) 
    )),
    home: const Expenses(),
    ),
  );
  
}
