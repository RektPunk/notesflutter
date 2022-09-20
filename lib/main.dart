import 'package:flutter/material.dart';
import 'package:notes/pages/note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    final appBarTitleTextStyle = Theme.of(context)
        .textTheme
        .headline4
        ?.copyWith(color: Colors.green, fontWeight: FontWeight.w600);

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: appBarTitleTextStyle,
        ),
      ),
      home: const NotePage(),
    );
  }
}
