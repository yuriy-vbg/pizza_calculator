import 'package:flutter/material.dart';
import 'package:pizza_calculator/nav_drawer.dart';
import 'package:pizza_calculator/utils/global_theme.dart';
import 'package:pizza_calculator/utils/strings.dart';
import 'package:pizza_calculator/utils/global_theme.dart';
import 'package:pizza_calculator/utils/strings.dart';

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
  double _currentSliderValue = 20;
  bool _isDarkTheme = false;



  Widget _navigationDraw() => Drawer(
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
  );

  PreferredSizeWidget _appBar() => AppBar(
    title: const Text('Pizza App', ),
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
    return MaterialApp(
      theme: globalTheme(),


      home: Scaffold(
        appBar: _appBar(),
        drawer: navDrawer(context, _messengerKey),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Заголовок', style: Theme.of(context).textTheme.headline6),
                Container(
                  height: 100,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Row(
                  children: const [
                    Text('Логин: '),
                    Expanded(child: TextField()),
                  ],
                ),
                Row(
                  children: const [
                    Text('Пароль: '),
                    Expanded(child: TextField()),
                  ],
                ),
                ElevatedButton(onPressed: () {}, child: Text('Войти')),
                const Text(Strings.longBodyText),
                Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                SwitchListTile(
                    title: Text('Тёмная тема'),
                    value: _isDarkTheme,
                    onChanged: (val) {
                      setState(() {
                        _isDarkTheme = !_isDarkTheme;
                        if (_isDarkTheme) {

                        }
                      });
                    }),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: Icon(Icons.add),
        ),
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

class _messengerKey {
}

