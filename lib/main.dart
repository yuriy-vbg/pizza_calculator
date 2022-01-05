import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sliding_switch/sliding_switch.dart';


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
   _cost = _pizzaSize.round() -5 ; // формула расчета в зависимости от размера
   if (_pizzaSize.round() == 25) _cost += 300;
   if (_pizzaSize.round() == 30) _cost += 500;
   if (_pizzaSize.round() == 35) _cost += 700;
   if (_isSlimDough == true) _cost -= 100; // условие при выборе теса
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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        body: Container (
         width: double.infinity,
         height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column (
              children: [
                const SizedBox(
                  height: 62,
                ),
                SizedBox(
                  height: 150,
                  width: 500,
                  child: Image.asset("assets/images/pizza_icon.jpg"),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Калькулятор пиццы",
                style: TextStyle(fontSize: 30, color: Color(0xFF000000))),
                const SizedBox(
                  height: 20,
                ),
                const Text("Выберите параметры:",
                    style: TextStyle(fontSize: 16, color: Color(0xFF000000))),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text("Размер:",
                      style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      _pizzaSize.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize:18, color: Colors.blue ),
                    ),
                    const Text("cm",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize:16, color: Colors.blue )
                    )
                  ],
                ),
                SizedBox(
                  width: 360,
                  child: Slider(
                    value: _pizzaSize,
                    onChanged: (value) {
                      setState(() {
                        _pizzaSize = value;
                      });
                    },
                    min: 25,
                    max: 35,
                    activeColor: Colors.blue,
                    inactiveColor: Colors.blue[200],
                    label: _pizzaSize.round().toString(),
                    divisions: 2,
                  ),
                ),

                SizedBox(
                  width: 360,
                  child: Row(
                    children: const [
                      Expanded(child: Text("Маленькая", textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize:14, color: Colors.blue ))),
                      Expanded(child: Center(child: Text("Средняя",
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize:14, color: Colors.blue )))),
                      Expanded(child: Text("Большая", textAlign: TextAlign.right,
                          style: TextStyle(fontWeight: FontWeight.normal, fontSize:14, color: Colors.blue ))),
                    ],
                  ),
                ),


                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 20),
                  child: const Text("Тесто:",
                      style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                ),
                const SizedBox(
                  height: 20,
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
                  height: 40, // высота
                  animationDuration: const Duration(milliseconds: 100), // длительность анимации переключения кнопок
                  onTap: () {}, // пустые обработчики нажатия
                  onDoubleTap: () {},
                  onSwipe: () {},
                  textOff: "Традиционное",
                  textOn: "Тонкое",
                  colorOn: const Color(0xffFFFFFF),//цвет текста в состоянии включено
                  colorOff: const Color(0xf0FFFFFF),//цвет текста в состоянии выключено
                  background: const Color(0xffECEFF1),// цвет фона
                  buttonColor: const Color(0xff0079D0),// активный цвет переключателя
                  inactiveColor: const Color(0xff636f7b),//неактивный цвет переключателя
                ),
               const SizedBox (
                 height: 20,
               ),

               Container(
                 alignment: Alignment.centerLeft,
                 padding: const EdgeInsets.only(top: 10),
                 child: const Text("Соус:",
                 style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
                       ),
             // радиогруппа с 3 элементами :
             RadioListTile<Sauce>(
                title: const Text("Острый"),
                value: Sauce.hot,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
               //visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
             ),
             RadioListTile<Sauce>(
                title: const Text("Кисло-сладкий"),
                value: Sauce.sweet,
                groupValue: _sauce,
                onChanged: _onSauceChanged,
               // visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),
             RadioListTile<Sauce>(
                  title: const Text("Сырный"),
                  value: Sauce.cheese,
                  groupValue: _sauce,
                  onChanged: _onSauceChanged,
                 // visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
                ),
             // дополнительный сыр:
            SizedBox(
              width: 300,
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
                       child: Image.asset("assets/images/cheese_icon.png"),
                     ),
                   ),
                   const Text("Дополнительный сыр",
                   style: TextStyle(fontSize: 16, color: Color(0xFF263238))),
                   Switch(
                       value: _addCheese,
                       onChanged: (bool value) {
                         setState(() {
                           _addCheese = value;
                           _calcCost();
                         });
                       }
                   ),
                 ],
               ),
              ),
            ),

            //Вывод итоговой стоимости:
             Container(
               alignment: Alignment.centerLeft,
               padding: const EdgeInsets.only(top: 20),
               child: const Text("Стоимость:", textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
              ),
                const SizedBox(
                  height: 10,
                ),
                // Цена в отдельной строке
             SizedBox(
              width: 300,
              height: 50,

              child: Card(
               elevation: 0,
               color: const Color(0xFFF0F0F0),
               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(36)),
               child: Center(
                 child: Text("${_calcCost()} руб. ", textAlign: TextAlign.center,
                 style: const TextStyle(fontSize: 24, color: Color(0xFF000000)),
                 ),
               ),
              ),
             ),
              const SizedBox(
              height: 30,
              ),
               // кнопка заказать:
               SizedBox(width: 170, height: 50,child:
                ElevatedButton(onPressed: () {},
                  child: const Text("Заказать",
                    style: TextStyle (fontWeight: FontWeight.bold, fontSize:18,
                        color: Color.fromRGBO(225,225,225,0.95) ),),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFf59300),
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












