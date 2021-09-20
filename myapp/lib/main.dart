import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'view/root.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.grey),
          elevation: 0.4,
        )
      ),
      home: const RootView(),
    );
  }
}
