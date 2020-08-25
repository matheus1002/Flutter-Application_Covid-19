import 'package:flutter/material.dart';
import 'package:covid19/src/view/home_page.dart';
import 'package:covid19/src/view/states_page.dart';
import 'package:covid19/src/view/countries_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: MainApp(),
    title: "Covid Monitoring",
    debugShowCheckedModeBanner: false,
  ));
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  int _currentIndex = 0;
  final List<Widget> _children =
  [
    HomePage(),
    StatePage(),
    CountriesPage(),
  ];

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            title: Text('Início'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidFlag),
            title: Text('Estados'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.globeAmericas),
            title: Text('Países'),
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurpleAccent,
        onTap: _onTappedBar,
      ),
    );

  }

}


/*
class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  Widget build(BuildContext context) {
    return PageIndicatorContainer(
        child: PageView(
          children: <Widget>[
            Home(),
            States(),
            Countries(),
            Recommendation(),
            About(),
          ],
          controller: _controller,
        ),
        align: IndicatorAlign.bottom,
        length: 5,
        indicatorSpace: 20.0,
        padding: const EdgeInsets.all(10),
        indicatorColor: Color(0xB3063d61),
        indicatorSelectorColor: Colors.white,
        shape: IndicatorShape.circle(size: 12));
  }
}
*/


