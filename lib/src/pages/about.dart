import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  Future<void> _launchedDev;
  Future<void> _launchedApi;
  Future<void> _launchedWho;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunchDev = 'https://github.com/matheus1002';
    const String toLaunchApi =
        'https://github.com/devarthurribeiro/covid19-brazil-api';
    const String toLaunchWho = 'https://www.who.int/';

    return Scaffold(
      backgroundColor: Color(0xB3063d61),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 60.0),
              child: Text(
                "COVID-19",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 52.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                "monitoring",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Text(
                "Versão",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                "1.0.0",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Text(
                "Desenvolvedor",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Text(
                "Matheus Carneiro Vasconcelos",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: InkWell(
                onTap: () => setState(() {
                  _launchedDev = _launchInBrowser(toLaunchDev);
                }),
                child: Text(
                  "github.com/matheus1002",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Text(
                "API",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Text(
                "COVID-19 BrazilAPI",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: InkWell(
                onTap: () => setState(() {
                  _launchedDev = _launchInBrowser(toLaunchApi);
                }),
                child: Text(
                  "github.com/devarthurribeiro/covid19-brazil-api",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Text(
                "Fonte",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 6.0),
              child: Text(
                "World Heath Organization",
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.only(bottom: 60.0),
              child: InkWell(
                onTap: () => setState(() {
                  _launchedDev = _launchInBrowser(toLaunchWho);
                }),
                child: Text(
                  "www.who.int",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
