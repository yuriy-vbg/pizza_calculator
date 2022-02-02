import 'package:flutter/material.dart';
import 'package:pizza_calculator/registration_page.dart';
import 'navigation_demo.dart';
import 'auth_page.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  get buttonStyle => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: _messengerKey,
        home: Scaffold(
            appBar:
                buildAppBar(titleStr: 'Pizza AppBar', buttonStyle: buttonStyle),
            drawer: Drawer(
              child: ListView(padding: EdgeInsets.zero, children: const []),
            ),
            body: const MaterialApp(
                //initialRoute: '/',
                //routes: {
                // When navigating to the "/" route, build the FirstScreen widget.
                //'/': (context) => const FirstScreen(),
                // When navigating to the "/second" route, build the SecondScreen widget.
                //'/second': (context) => const SecondScreen(),
                // },
                // decoration: const BoxDecoration(
                // image: DecorationImage (
                // image: AssetImage("assets/pizza17.png"),
                // fit: BoxFit.cover,
                // ),
                // ),
                // )
                )));
  }
}

AppBar buildAppBar({required String titleStr, required var buttonStyle}) {
  return AppBar(
    backgroundColor: const Color(0xffDB2520),
    title: Text(titleStr),
    actions: <Widget>[
      IconButton(
          tooltip: "Баланс",
          onPressed: () {},
          icon: const Icon(Icons.account_balance)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      TextButton(
        onPressed: () {},
        child: const Text(
          'Профиль',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
        ),
        style: buttonStyle,
      ),
    ],
  );
}
