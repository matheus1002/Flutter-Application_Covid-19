import 'package:covid19/src/pages/about.dart';
import 'package:covid19/src/pages/countries.dart';
import 'package:covid19/src/pages/home.dart';
import 'package:covid19/src/pages/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_indicator/page_indicator.dart';

class Init extends StatefulWidget {
  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
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
            About(),
          ],
          controller: _controller,
        ),
        align: IndicatorAlign.bottom,
        length: 4,
        indicatorSpace: 20.0,
        padding: const EdgeInsets.all(10),
        indicatorColor: Color(0xB3063d61),
        indicatorSelectorColor: Colors.white,
        shape: IndicatorShape.circle(size: 12));

    /*
    return PageView(
      controller: _controller,
      children: [
        Home(),
        States(),
        Countries(),
        About(),
      ],
    );*/
  }
}
