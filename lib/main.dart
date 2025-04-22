import 'package:flutter/material.dart';
import 'core/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Core Ont',
      debugShowCheckedModeBanner:false,
      theme: AppTheme(selectedColor:0).theme(),
      home: Center(
        child: IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app)),
      ),
      );
  }
}
