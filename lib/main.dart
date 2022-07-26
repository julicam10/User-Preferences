import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import 'package:user_preferences/screens/screens.dart';

import 'share_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Asegura que la aplicación abra utilizando Shared preferences

  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingScreen.routeName: (_) => const SettingScreen()
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
