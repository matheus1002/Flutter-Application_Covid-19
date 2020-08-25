import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Map> getWeather() async {
    http.Response response = await http
        .get("https://covid19-brazil-api.now.sh/api/report/v1/brazil");
    return jsonDecode(response.body);
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
    DateFormat dateFormat = DateFormat("dd/MM/y");

    return Scaffold(
        body: FutureBuilder<Map>(
      future: getWeather(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Text(
                "Carregando...",
                style:
                    TextStyle(color: Colors.deepPurpleAccent, fontSize: 22.0),
                textAlign: TextAlign.center,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Erro ao carregar os dados",
                  style:
                      TextStyle(color: Colors.deepPurpleAccent, fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              /* VARIÁVEIS DE FORMATAÇÃO DE DATA */
              String date = snapshot.data["data"]["updated_at"];
              String _dateFormatted = dateFormat.format(DateTime.parse(date));

              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.deepPurpleAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text("Covid 19",
                                style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(
                                    fontSize: 46.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))),
                        Text("monitoring",
                            style: GoogleFonts.comfortaa(
                              textStyle: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListView(
                        children: [
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.globeAmericas),
                            title: Text("Pais"),
                            trailing: Text(snapshot.data["data"]["country"]),
                          ),
                          ListTile(
                            leading:
                                FaIcon(FontAwesomeIcons.exclamationTriangle),
                            title: Text("Casos"),
                            trailing:
                                Text(snapshot.data["data"]["cases"].toString()),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.tired),
                            title: Text("Confirmados"),
                            trailing: Text(
                                snapshot.data["data"]["confirmed"].toString()),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.skull),
                            title: Text("Mortes"),
                            trailing: Text(
                                snapshot.data["data"]["deaths"].toString()),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.smile),
                            title: Text("Recuperados"),
                            trailing: Text(
                                snapshot.data["data"]["recovered"].toString()),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.clock),
                            title: Text("Último Boletim"),
                            trailing: Text(_dateFormatted),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
        }
      },
    ));
  }
}
