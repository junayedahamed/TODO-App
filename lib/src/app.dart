import 'package:flutter/material.dart';
import 'package:todo/src/homepage/homepage.dart';
import 'package:todo/src/theme/change_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: ToggleSwitch.instance,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: ToggleSwitch.instance.themeMode,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
              useMaterial3: true,
            ),
            home: const HomePage(),
          );
        });
  }
}
