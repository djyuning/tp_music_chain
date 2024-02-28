import 'package:flutter/material.dart';
import 'package:tp_music_chain/pages/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Color.fromARGB(255, 61, 61, 61),
          secondary: Color.fromARGB(255, 255, 197, 81),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: '🥳 DJ Radio'),
    );
  }
}
