import 'package:flutter/material.dart';
import 'package:pizza_calculator/screens/nav_drawer.dart';
import 'package:pizza_calculator/screens/pizza_calculator_page.dart';
import 'package:pizza_calculator/screens/registration_page.dart';
import 'package:pizza_calculator/utils/global_theme.dart';
import 'package:pizza_calculator/utils/strings.dart';
import 'package:pizza_calculator/utils/global_theme.dart';
import 'package:pizza_calculator/utils/strings.dart';
import 'auth_page.dart';
import 'nav_drawer1.dart';
import 'navigation_drawer_screen.dart';


main() {
  runApp(const ThemesDemoApp());
}

class ThemesDemoApp extends StatelessWidget {
  const ThemesDemoApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: globalTheme(),
      home: const ThemesDemoScreen(),
    );
  }
}

class ThemesDemoScreen extends StatefulWidget {
  const ThemesDemoScreen({Key? key}) : super(key: key);
  @override
  _ThemesDemoScreenState createState() => _ThemesDemoScreenState();
}

class _ThemesDemoScreenState extends State<ThemesDemoScreen> {
  final double _currentSliderValue = 20;
  final bool _isDarkTheme = false;

  /* Widget _navigationDraw() => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.red,
          ),
          child: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 130,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: const SizedBox(
                    width: 330,
                    height: 94,
                    child: Image(
                        image: AssetImage('assets/images/pizza-logo12.png')),
                  ),
                ),
              ],
            ),
          ),
        ),

        ListTile(
          leading: const Icon(Icons.menu_book, color: Colors.black54),
          title: const Text(
            'Авторизация',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.9)),
          ),
          onTap: () {
            //Navigator.pop(context);
            Navigator.pushNamed(context, '/auth_page');
          },
        ),


        ListTile(
          leading: const Icon(Icons.remember_me, color: Colors.black54),
          title: const Text(
            'Регистрация',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.9)),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/registration_page');
          },
        ),

      ListTile(
            leading: const Icon(Icons.calculate_rounded, color: Colors.black54),
            title: const Text(
              'Калькулятор пиццы',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.9)),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/pizza_calculator_page');

            },
          ),


        Container(
          decoration: const BoxDecoration(),
          child: const Divider(
            height: 20,
            thickness: 1,
            indent: 1,
            endIndent: 1,
            color: Colors.black54,
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text("Профиль",
              style: TextStyle(  fontSize: 12,
                  color: Colors.black, fontWeight: FontWeight.normal)),
        ),

        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Настройки", style: TextStyle(
              fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.9)),),
          onTap: () {},
        ),
      ],
    ),
  );*/

  PreferredSizeWidget _appBar() => AppBar(
        title: const Text(
          'Pizza App',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Уведомления',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Уведомления',
            onPressed: () {},
          ),
        ],
      );


  @override
  Widget build(BuildContext context) {
        const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 2));
    const linkTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFFFFFFF),
    );

    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(
        appBar: _appBar(),
        drawer: navDrawer1(context, _messengerKey),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pizza17.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const SizedBox(
                    width: 180,
                    height: 120,
                    child: Image(image: AssetImage('assets/auth_icon3.png')),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("АВТОРИЗАЦИЯ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFFFFFFFF))),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    indent: 1,
                    endIndent: 1,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'введите логин в виде 10 цифр номера телефона',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(255, 255, 255, 0.9)),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'телефон',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFeceff1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      labelText: 'пароль',
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 154,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('ВОЙТИ'),
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF85C227),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      child: const Text(
                        'регистрация',
                        style: linkTextStyle,
                      ),
                      onTap: () {}),
                  const SizedBox(
                    height: 14,
                  ),
                  InkWell(
                    child: const Text(
                      'забыли пароль?',
                      style: linkTextStyle,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //const SizedBox(
                  // width: 200,
                  //height: 150,
                  //child: Image(image: AssetImage('assets/images/Stamp.png')),
                  // ),
                ],
              ),
            ),
          ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),*/
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: 'Профиль'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: 'Баланс'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Настройки'),
          ],
        ),
      ),
    );
  }
}

class _messengerKey {}
