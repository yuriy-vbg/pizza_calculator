import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatelessWidget {
  const SharedPrefScreen({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Shared preferences demo',
      home: MyHomePage(title: 'Shared preferences demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  get children => null;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            const SizedBox(
              height: 0,
            ),
            const SizedBox(
              width: 180,
              height: 120,
              child: Image(image: AssetImage('assets/images/calculator_icon3.png')),
            ),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (_incrementCounter), child: const Text('Нажми меня')),

            const SizedBox(
              height: 20,
            ),
            const Text(
              'Вы нажали кнопку столько раз:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline3,
            ),
            const Text('Нажимай, пока нажимается'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}