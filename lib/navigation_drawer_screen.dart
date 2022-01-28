import 'package:flutter/material.dart';
import 'package:pizza_calculator/registration_page.dart';
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
            appBar: AppBar(
              backgroundColor: const Color(0xffDB2520),

              title: const Text("Pizza AppBar"),
              actions: <Widget>[
                IconButton(
                    tooltip: "Баланс",
                    onPressed: () {},
                    icon: const Icon(Icons.account_balance)
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
                TextButton(
                  onPressed: () {},
                  child: const Text('Профиль',textAlign: TextAlign.left,
                  style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                  style: buttonStyle,
                ),
              ],
            ),
          drawer: Drawer(
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

                            height : 130,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child:  const SizedBox(width: 330, height: 94, child: Image (image: AssetImage('assets/images/pizza-logo12.png')),),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage (
                        image: AssetImage("assets/pizza17.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.menu_book, color: Colors.white),
                      title: const Text('Меню',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Меню')));
                      },
                    ),
                  ),
                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.flag_outlined, color: Colors.white ),
                      title: const Text('Акции',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Акции')));
                      },
                    ),
                  ),

                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.shopping_cart_outlined , color: Colors.white),
                      title: const Text('Корзина',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Корзину')));
                      },
                    ),
                  ),


                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.credit_score, color: Colors.white),
                      title: const Text('История заказов',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Историю заказов')));
                      },
                    ),
                  ),


                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.favorite_border, color: Colors.white),
                      title: const Text('Избранное',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Избранное')));
                      },
                    ),
                  ),

                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.call, color: Colors.white),
                      title: const Text('Заказ по телефону',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Заказ по телефону')));
                      },
                    ),
                  ),


                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.phone_in_talk_rounded, color: Colors.white),
                      title: const Text('Обратный звонок',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Обратный звонок')));
                      },
                    ),
                  ),

                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.place, color: Colors.white),
                      title: const Text('О компании',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в О компании')));
                      },
                    ),
                  ),



                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: const Divider(
                      height: 20,
                      thickness: 1,
                      indent: 1,
                      endIndent: 1,
                      color: Colors.white,
                    ),
                  ),
                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child:  Text('Профиль',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:12,color: Color.fromRGBO(255,255,255,0.9)),),
                    ),
                  ),

                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.settings, color: Colors.white),
                      title: const Text('Личный кабинет',textAlign: TextAlign.left,
                      style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Личный кабинет')));
                      },
                    ),
                  ),

                  Container(decoration: const BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage("assets/pizza17.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                    child: ListTile(
                      leading: const Icon(Icons.notifications_active_outlined , color: Colors.white),
                      title: const Text('Уведомления',textAlign: TextAlign.left,
                        style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                      onTap: () {
                        _messengerKey.currentState!.showSnackBar(
                            const SnackBar(content: Text('Переход в Уведомления')));
                      },
                    ),
                  ),

                  ]
            ),
          ),
    body: Container(
    decoration: const BoxDecoration(
    image: DecorationImage (
    image: AssetImage("assets/pizza17.png"),
    fit: BoxFit.cover,
    ),
    ),
    )
        )
    );
  }
}
