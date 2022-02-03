import 'package:flutter/material.dart';
import 'package:pizza_calculator/screens/nav_drawer1.dart';

import 'nav_drawer.dart';
import 'navigation_drawer_screen.dart';

void main() {
  runApp( RegistrationPage());
}

class RegistrationPage extends StatelessWidget {
RegistrationPage ({Key? key}) : super(key: key);
final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const borderStyle = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(36)),
        borderSide: BorderSide (
            color: Color(0xFFFFFFFF), width: 2));
    const linkTextStyle = TextStyle(
      fontSize:16,
      fontWeight: FontWeight.normal,
      color: Color(0xFFFFFFFF),
    );

    return MaterialApp(
      home: Scaffold(
          appBar: buildAppBar(titleStr: 'Pizza AppBar', buttonStyle: null),
          drawer: navDrawer1(context, _messengerKey),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage (
                image: AssetImage("assets/pizza17.png"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column (children: [
                const SizedBox(height: 40,),
                const SizedBox(width: 170, height: 120, child: Image (image: AssetImage('assets/registration_icon_white.png')),),
                const SizedBox(
                  height:15,
                ),
                const Text("РЕГИСТРАЦИЯ",
                    style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFFFFFFFF))),

                const Divider(
                  height: 20,
                  thickness: 2,
                  indent: 1,
                  endIndent: 1,
                  color: Colors.white,
                ),

                const SizedBox(height:0,),
                const Text('чтобы зарегестрироваться введите свой номер телефона и почту',textAlign: TextAlign.center,
                  style: TextStyle(fontSize:16,color: Color.fromRGBO(255,255,255,0.9)),),
                const SizedBox(height:25,),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration (
                    filled: true,
                    fillColor: Color (0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,

                    labelText: 'телефон',
                  ),
                ),
                const SizedBox(height:25,),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration (
                    filled: true,
                    fillColor: Color (0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'почта',
                  ),
                ),
                const SizedBox(height: 25,),
                SizedBox(width:154,height: 55, child:
                ElevatedButton(onPressed: () {},
                  child: const Text ('ОТПРАВИТЬ КОД'),
                  style:ElevatedButton.styleFrom(
                    primary: const Color(0xFF85C227),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular (36.0),
                    ),
                  ),
                ),
                ),
                const SizedBox(height: 25,),
                InkWell(child: const Text('Вам придет четырехзначный код, который будет паролем',textAlign: TextAlign.center, style: linkTextStyle,),
                    onTap:() {}),
                const SizedBox(height: 14,),
                InkWell(child: const Text('после регистрации изменить пароль можно только в личном кабинете ',textAlign: TextAlign.center, style: linkTextStyle,),onTap:() {},),

                //const SizedBox(height: 13,),
                //const SizedBox(width: 200, height: 150, child: Image (image: AssetImage('assets/Stamp.png')),),

                const SizedBox(
                  height: 20,
                ),

              ],
              ),
            ),
          )
      ),
    );
  }
}

