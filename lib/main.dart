import 'package:flutter/cupertino.dart';
import 'package:spell_checker/home_screen.dart';
import 'package:spell_checker/colors.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
          brightness: Brightness.light, primaryColor: themeColor),
      home: HomeScreen(),
    );
  }
}
