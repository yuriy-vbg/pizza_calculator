import 'package:flutter/material.dart';

Widget navDrawer(context, _messengerKey) => Drawer(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pizza17.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(padding: EdgeInsets.zero, children: [
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
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
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
              style: TextStyle(
                  fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/registration_page');
            },
          ),

          Container(
            decoration: const BoxDecoration(),
            child: ListTile(
              leading: const Icon(Icons.calculate_rounded, color: Colors.white),
              title: const Text(
                'Калькулятор пиццы',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/pizza_calculator_page');
                _messengerKey.currentState!.showSnackBar(const SnackBar(
                    content: Text('Переход в Калькулятор пиццы')));
              },
            ),
          ),
          //Container(decoration: const BoxDecoration(

          //),
          //child: ListTile(
          //leading: const Icon(Icons.flag_outlined, color: Colors.white ),
          //title: const Text('Меню',textAlign: TextAlign.left,
          //  style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
          // onTap: () {

          // Navigator.pushNamed(context, '/auth_page');

          // _messengerKey.currentState!.showSnackBar(
          //  const SnackBar(content: Text('Переход в Меню')));
          // },
          // ),
          //),

          Container(
            decoration: const BoxDecoration(),
            child: ListTile(
              leading:
                  const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              title: const Text(
                'Корзина',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
              ),
              onTap: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в Корзину')));
              },
            ),
          ),

          Container(
            decoration: const BoxDecoration(),
            child: ListTile(
              leading: const Icon(Icons.credit_score, color: Colors.white),
              title: const Text(
                'История заказов',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
              ),
              onTap: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в Историю заказов')));
              },
            ),
          ),

          // Container(decoration: const BoxDecoration(

          // ),
          // child: ListTile(
          //  leading: const Icon(Icons.favorite_border, color: Colors.white),
          //title: const Text('Избранное',textAlign: TextAlign.left,
          // style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
          // onTap: () {
          //_messengerKey.currentState!.showSnackBar(
          //   const SnackBar(content: Text('Переход в Избранное')));
          // },
          // ),
          //  ),

          //Container(decoration: const BoxDecoration(
          //),
          // child: ListTile(
          // leading: const Icon(Icons.call, color: Colors.white),
          // title: const Text('Заказ по телефону',textAlign: TextAlign.left,
          //  style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
          // onTap: () {
          //  _messengerKey.currentState!.showSnackBar(
          //    const SnackBar(content: Text('Переход в Заказ по телефону')));
          // },
          // ),
          //),

          Container(
            decoration: const BoxDecoration(),
            child: ListTile(
              leading:
                  const Icon(Icons.phone_in_talk_rounded, color: Colors.white),
              title: const Text(
                'Обратный звонок',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
              ),
              onTap: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в Обратный звонок')));
              },
            ),
          ),

          Container(
            decoration: const BoxDecoration(),
            child: ListTile(
              leading: const Icon(Icons.place, color: Colors.white),
              title: const Text(
                'О компании',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
              ),
              onTap: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в О компании')));
              },
            ),
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
          Container(
            decoration: const BoxDecoration(),
            child: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Профиль',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(255, 255, 255, 0.9)),
              ),
            ),
          ),

          Container(
            decoration: const BoxDecoration(),
            child: ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                'Личный кабинет',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
              ),
              onTap: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в Личный кабинет')));
              },
            ),
          ),

          Container(
            decoration: const BoxDecoration(),
            child: ListTile(
              leading: const Icon(Icons.notifications_active_outlined,
                  color: Colors.white),
              title: const Text(
                'Уведомления',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 255, 255, 0.9)),
              ),
              onTap: () {
                _messengerKey.currentState!.showSnackBar(
                    const SnackBar(content: Text('Переход в Уведомления')));
              },
            ),
          ),
        ]),
      ),
    );
