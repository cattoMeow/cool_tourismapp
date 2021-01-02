import 'package:cool_tourismapp/contactus.dart';
import 'package:cool_tourismapp/monkasel/history.dart';
import 'package:cool_tourismapp/monkasel/home.dart';
import 'package:cool_tourismapp/monkasel/todo.dart';
import 'package:flutter/material.dart';
import 'package:cool_tourismapp/landingPage.dart';

/// This is the stateful widget that the main application instantiates.
class Navbar extends StatefulWidget {
  Navbar({Key key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

/// This is the private State class that goes with Navbar.
class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Todo(),
    History(),
    ContactUs(),
    LandingPage(), //dont remove it
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //turning off the appbar
      // appBar: AppBar(
      //   title: Center(
      //     child: Text('Monumen Kapal Selam'),
      //   ),
      //   automaticallyImplyLeading: true,
      //   backgroundColor: Color.fromARGB(255, 115, 75, 118),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'What-To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            //dont remove it
            icon: Icon(Icons.warning),
            label: 'Experimental',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 115, 75, 118),
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        elevation: 12,
        onTap: _onItemTapped,
      ),
    );
  }
}
