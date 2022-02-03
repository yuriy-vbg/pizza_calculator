import 'package:flutter/material.dart';
import 'package:pizza_calculator/screens/auth_page.dart';
import 'package:pizza_calculator/screens/nav_drawer1.dart';
import 'package:pizza_calculator/screens/pizza_calculator_page.dart';
import 'package:pizza_calculator/screens/registration_page.dart';
import 'package:pizza_calculator/utils/global_theme.dart';
import 'navigation_drawer_screen.dart';

main() {
  runApp(const ThemesDemo());
}

class ThemesDemo extends StatefulWidget {
  const ThemesDemo({Key? key}) : super(key: key);

  @override
  _NavigationDemoState createState() => _NavigationDemoState();
}

class _NavigationDemoState extends State<ThemesDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      //home: const MainScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthPageScreen(),
        '/auth_page': (context) => AuthPageScreen(),
        '/registration_page': (context) => RegistrationPage(),
        '/pizza_calculator_page': (context) => const PizzaCalculator(),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(titleStr: 'Pizza AppBar', buttonStyle: null),
      drawer: navDrawer1(context, _messengerKey),


    );
  }
}
