import 'package:flutter/material.dart';

Widget navDrawer1(context, _messengerKey) => Drawer(

child: Container(
decoration: const BoxDecoration(
image: DecorationImage(
image: AssetImage("assets/pizza17.png"),
fit: BoxFit.cover,
),
),

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
        leading: const Icon(Icons.menu_book, color: Colors.white),
        title: const Text(
          'Авторизация',
          textAlign: TextAlign.left,
          style: TextStyle( fontWeight: FontWeight.bold,
              fontSize: 16, color: Color.fromRGBO(254, 254, 254, 0.9)),
        ),
        onTap: () {
          //Navigator.pop(context);
          Navigator.pushNamed(context, '/auth_page');
        },
      ),


      ListTile(
        leading: const Icon(Icons.remember_me, color: Colors.white),
        title: const Text(
          'Регистрация',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 16, color: Color.fromRGBO(254, 254, 254, 0.9)),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/registration_page');
        },
      ),

      ListTile(
        leading: const Icon(Icons.calculate_rounded, color: Colors.white),
        title: const Text(
          'Калькулятор пиццы',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 16, color: Color.fromRGBO(254, 254, 254, 0.9)),
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
          color: Colors.white,
        ),
      ),

      const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text("Профиль",
            style: TextStyle(  fontSize: 12,
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),

      ListTile(
        leading: const Icon(Icons.settings, color: Colors.white),
        title: const Text("Настройки", style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 16, color: Color.fromRGBO(254, 254, 254, 0.9)),),
        onTap: () {},
      ),
    ],
  ))
);
