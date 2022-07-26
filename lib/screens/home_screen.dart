import 'package:flutter/material.dart';

import 'package:user_preferences/widgets/widgets.dart';

import '../share_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          elevation: 0,
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkmode: ${Preferences.isDarkMode}'),
            const Divider(),
            Text('Gender: ${Preferences.gender}'),
            const Divider(),
            Text('User name: ${Preferences.name}'),
          ],
        ),
      ),
    );
  }
}
