import 'package:flutter/material.dart';
import 'package:quiz_app/style/theme.dart';
import 'package:quiz_app/view/home_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      // themeMode: ThemeMode.light,
      // themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}