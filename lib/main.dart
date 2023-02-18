import 'package:flutter/material.dart';
import 'package:pruebas/pages/algoritmo.dart';
import 'package:pruebas/pages/calificacion.dart';
import 'package:pruebas/pages/gangster.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeController(title: 'Prueba Flutter'),
    );
  }
}

class HomeController extends StatefulWidget {
  HomeController({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Calificacion(),
    Gangster(),
    Algoritmo(),

  ];

  static const List<BottomNavigationBarItem> _navigationItems =
      <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.note_alt), label: 'Calificación'),
    BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Gangster'),
    BottomNavigationBarItem(icon: Icon(Icons.account_tree), label: 'Algoritmo'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        items: _navigationItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
