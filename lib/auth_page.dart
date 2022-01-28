import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                const SizedBox(height: 60,),
                const SizedBox(width: 180, height: 120, child: Image (image: AssetImage('assets/auth_icon3.png')),),

                const SizedBox(
                  height:15,
                ),
                const Text("АВТОРИЗАЦИЯ",
                    style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFFFFFFFF))),

                const Divider(
                  height: 20,
                  thickness: 2,
                  indent: 1,
                  endIndent: 1,
                  color: Colors.white,
                ),

                const SizedBox(height:5,),
                const Text('введите логин в виде 10 цифр номера телефона',textAlign: TextAlign.center,
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
                const SizedBox(height:30,),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration (
                    filled: true,
                    fillColor: Color (0xFFeceff1),
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    labelText: 'пароль',
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(width:154,height: 55, child:
                ElevatedButton(onPressed: () {},
                  child: const Text ('ВОЙТИ'),
                  style:ElevatedButton.styleFrom(
                    primary: const Color(0xFF85C227),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular (36.0),
                    ),
                  ),
                ),


                ),
                const SizedBox(height: 30,),
                InkWell(child: const Text('регистрация',  style: linkTextStyle,),
                    onTap:() {}),
                const SizedBox(height: 14,),
                InkWell(child: const Text('забыли пароль?', style: linkTextStyle,),onTap:() {},),

                const SizedBox(height: 20,),
                const SizedBox(width: 200, height: 150, child: Image (image: AssetImage('assets/images/Stamp.png')),),

              ],),
            ),
          )
      ),
    );
  }
}

