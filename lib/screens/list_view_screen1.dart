import 'package:flutter/material.dart';


void main() {
  runApp(const ListViewScreen1());
}


class ListViewScreen1 extends StatelessWidget {
  const ListViewScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(
      body: MyStatefulWidget (),
    ));
  }
}

class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, required this.number}) : super(key: key);

  //final string text
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          border: Border.all()
      ),
      child: Text('Элемент # $number', style: Theme.of(context).textTheme.headline5),
    );
  }
}

/*class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: const [
        MyListItem (number:1),
        MyListItem (number:2),
        MyListItem (number:3),
        MyListItem (number:4),
        MyListItem (number:5),
        MyListItem (number:6),
        MyListItem (number:7),
        MyListItem (number:8),
        MyListItem (number:9),
        MyListItem (number:10),
        MyListItem (number:11),
        MyListItem (number:12),
      ],
    );
  }
}*/


class SimpleList extends StatelessWidget {
  const SimpleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      // children: [
      //     // MyListItem(number: 1),
      //     // MyListItem(number: 2),
      //     // MyListItem(number: 3),
      //     // MyListItem(number: 4),
      //     // MyListItem(number: 5),
      //     // MyListItem(number: 6),
      //     // MyListItem(number: 7),
      //     // MyListItem(number: 8),
      //     // MyListItem(number: 9),
      //     // MyListItem(number: 10),
      //     // MyListItem(number: 11),
      //     // MyListItem(number: 12),
      //
      // ],
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text('Phone'),
        )],

    );
  }
}



class SimpleListBuilder extends StatelessWidget {
  const SimpleListBuilder({Key? key}) : super(key: key);

  //var list =  List<int>.generate(20, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return MyListItem(number: index);
        }
    );
  }
}


class SimpleListSeparated extends StatelessWidget {
 SimpleListSeparated ({Key? key}) : super(key: key);

  var list =  new List<int>.generate(50, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return MyListItem(number: index);
        }, separatorBuilder: (BuildContext context, int index) => const Divider (thickness: 3,),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index'),
          selected: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
        );
      },
    );
  }
}
