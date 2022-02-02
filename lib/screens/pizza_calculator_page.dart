import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

import 'nav_drawer.dart';
import 'navigation_drawer_screen.dart';


void main() {
  runApp(const PizzaCalculator());
}

class PizzaCalculator extends StatefulWidget {
  const PizzaCalculator({Key? key}) : super(key: key);

  @override
  _PizzaCalculatorState createState() => _PizzaCalculatorState();
}
enum Sauce {hot, sweet, cheese} // перечисление выбора для группы радиокнопок



class _PizzaCalculatorState extends State<PizzaCalculator> {
  // основные переменные:
  bool _isSlimDough = false; // параметр выбора теста, является ли тесто тонким, по умолчанию это обычное тесто, поэтому false
  double _pizzaSize = 30; // параметр для слайдера размеров
  int _cost = 100; // параметр для расчета стоимости
  Sauce? _sauce = Sauce.hot; // переменная для группы радиокнопок, по умолчанию стоит острый
  bool _addCheese = true; // логическая переменная для ползунка switch выбора дополнительного сыра

  // алгоритм вычисления стоимости пиццы:
  int _calcCost() {
    // функция расчета стоимости
    _cost = _pizzaSize.round() -10 ; // формула расчета в зависимости от размера
    if (_pizzaSize.round() == 25) _cost += 300;
    if (_pizzaSize.round() == 30) _cost += 550;
    if (_pizzaSize.round() == 35) _cost += 700;
    if (_isSlimDough == true) _cost -= 100; // условие при выборе теста
    if (_addCheese == true) _cost += 90; // условие при выборе дополнительного сыра
    // условия для радиокнопок при выборе соуса c использованием оператора switch case:
    switch (_sauce) {
      case Sauce.hot: // 1 вариант
        _cost += 30;
        break;
      case Sauce.sweet: // 2 вариант
        _cost += 50;
        break;
      case Sauce.cheese: // 3 вариант
        _cost += 70;
        break;
      case null: // нулевой вариант, т.е. по умолчанию выбирается 1 вариант
      // здесь вместо case null можно использовать default
        _sauce = Sauce.hot;
        break;
    }
    return _cost; // функция int _calcCost() возвращает _cost
  }

  // функция выбора соуса, которая принимает на вход выбор пользователя с допущением нулевого значения
  void _onSauceChanged (Sauce? value) {
    setState(() {
      _sauce = value; // с присвоением нового значения
    });
  }
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        appBar: buildAppBar(titleStr: 'Pizza AppBar', buttonStyle: null),
        drawer: navDrawer(context, _messengerKey),
        body: Container (
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
            child: Column (
              children: [
                const SizedBox(
                  height:40
                ),
                //SizedBox(
               // height: 150,
               // width: 500,
                //child: Image.asset("assets/images/pizza13.png"),
                //),
                const SizedBox(height: 0,),
                const SizedBox(width: 180, height: 120, child: Image (image: AssetImage('assets/images/calculator_icon2.png')),),

                const SizedBox(
                  height:15,
                ),
                const Text("КАЛЬКУЛЯТОР ПИЦЦЫ",
                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFFFFFFFF))),

                const Divider(
                  height: 20,
                  thickness: 2,
                  indent: 1,
                  endIndent: 1,
                  color: Colors.white,
                ),
                //Вывод итоговой стоимости:
                const SizedBox(
                  height: 10,
                ),
                // Цена в отдельной строке
                SizedBox(
                  width: 310,
                  height: 60,

                  child: Card(
                    elevation: 0,
                    color: const Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36)),
                    child: Center(
                      child: Text("цена ${_calcCost()} руб.", textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24, color: Color(0xFF000000)),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                const Text("выберите параметры",
                    style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 0),
                  child: const Text("ТЕСТО:",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFFFFFFFF))),
                ),
                const SizedBox(
                  height: 10,
                ),
                SlidingSwitch ( // для слайдеров сагружается импортируется отдельная библиотека sliding_switch и syncfusion
                  value: false,
                  width: 300,
                  onChanged: (bool value) {
                    _isSlimDough = value;
                    setState(() {
                      _calcCost();
                    });
                  },
                  height: 55, // высота
                  animationDuration: const Duration(milliseconds: 100), // длительность анимации переключения кнопок
                  onTap: () {}, // пустые обработчики нажатия
                  onDoubleTap: () {},
                  onSwipe: () {},
                  textOff: "традиционное",
                  textOn: "тонкое",
                  colorOn: const Color(0xffFFFFFF),//цвет текста в состоянии включено
                  colorOff: const Color(0xf0FFFFFF),//цвет текста в состоянии выключено
                  background: const Color(0xffECEFF1),// цвет фона
                  buttonColor: const Color(0xff86C225),// активный цвет переключателя
                  inactiveColor: const Color(0xff636f7b),//неактивный цвет переключателя
                ),
                const SizedBox (
                  height: 20,
                ),

                // дополнительный сыр:
                SizedBox(
                  height: 60,
                  width: 310,
                  child: Card (
                    elevation: 0,
                    color: const Color(0xFFF0F0F0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: SizedBox(
                            width: 30,
                            height: 30,
                            child: Image.asset("assets/images/cheese1.jpg"),
                          ),
                        ),
                        const Text("дополнительный сыр",
                            style: TextStyle(fontSize: 16, color: Color(0xFF263238))),
                        Switch(
                            value: _addCheese,
                            onChanged: (bool value) {
                              setState(() {
                                _addCheese = value;
                                _calcCost();
                              });
                            },
                          activeColor: Colors.lightGreen,
                          activeTrackColor: Colors.lightGreenAccent,
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text("РАЗМЕР:",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFFFFFFFF))),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      _pizzaSize.toString(),
                      style: const TextStyle( fontSize:24, color: Colors.white),
                    ),
                    const Text(" см",
                        style: TextStyle(fontSize:24, color: Colors.white)
                    )
                  ],
                ),
                SizedBox(
                  width: 340,
                  child: Slider(
                    value: _pizzaSize,
                    onChanged: (value) {
                      setState(() {
                        _pizzaSize = value;
                      });
                    },
                    min: 25,
                    max: 35,
                    activeColor: Colors.lightGreenAccent,
                    inactiveColor: Colors.white,
                    label: _pizzaSize.round().toString(),
                    divisions: 2,
                  ),
                ),

                SizedBox(
                  width: 360,
                  child: Row(
                    children: const [
                      Expanded(child: Text("маленькая", textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize:16, color: Colors.white ))),
                      Expanded(child: Center(child: Text("средняя",
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize:16, color: Colors.white)))),
                      Expanded(child: Text("большая", textAlign: TextAlign.right,
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize:16, color: Colors.white ))),
                    ],
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text("СОУС:",
                      style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20, color: Color(0xFFFFFFFF))),
                ),
                // радиогруппа с 3 элементами :
                SizedBox(
                  width: 200,
                  child: Center(
                    child: Column(
                      children: [
                        RadioListTile<Sauce>(
                          title: const Text("острый",
                              style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                          value: Sauce.hot,
                          groupValue: _sauce,
                          onChanged: _onSauceChanged,
                          activeColor: Colors.lightGreen,
                          //visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Center(
                    child: Column(
                      children: [
                        RadioListTile<Sauce>(
                          title: const Text("кисло-сладкий",
                              style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                          value: Sauce.sweet,
                          groupValue: _sauce,
                          onChanged: _onSauceChanged,
                          activeColor: Colors.lightGreen,
                          // visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Center(
                    child: Column(
                      children: [
                        RadioListTile<Sauce>(
                          title: const Text("сырный",
                              style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                          value: Sauce.cheese,
                          groupValue: _sauce,
                          onChanged: _onSauceChanged,
                          activeColor: Colors.lightGreen,
                          // visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                // кнопка заказать:
                SizedBox(width: 170, height: 55,child:
                ElevatedButton(onPressed: () {},
                  child: const Text("ЗАКАЗАТЬ",
                    style: TextStyle (fontWeight: FontWeight.bold, fontSize:16,
                        color: Color.fromRGBO(225,225,225,1) ),),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFD9241F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                  ),
                )
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}













