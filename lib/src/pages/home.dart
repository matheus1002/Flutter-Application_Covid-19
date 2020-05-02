import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Future<Map> _getStatistics() async {
    http.Response response;
    response = await http
        .get("https://covid19-brazil-api.now.sh/api/report/v1/brazil");
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getStatistics().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {

    DateFormat dateFormat = DateFormat("dd/MM/y");

    return Scaffold(
      backgroundColor: Color(0xB3063d61),
      body: FutureBuilder(
          future: _getStatistics(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 5.0,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao carregar os dados",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  );
                } else {

                  /* VARIÁVEIS DE FORMATAÇÃO DE DATA */
                  String date = snapshot.data["data"]["updated_at"];
                  String _dateFormatted = dateFormat.format(DateTime.parse(date));

                  return Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 80.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              "COVID-19",
                              style: GoogleFonts.comfortaa(
                                textStyle: TextStyle(
                                  fontSize: 58.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 50.0),
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
                          Card(
                            margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "País",
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.0),
                                      Text(
                                        snapshot.data["data"]["country"],
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Casos",
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.0),
                                      Text(
                                        snapshot.data["data"]["cases"]
                                            .toString(),
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Confirmados",
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.0),
                                      Text(
                                        snapshot.data["data"]["confirmed"]
                                            .toString(),
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Mortes",
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.0),
                                      Text(
                                        snapshot.data["data"]["deaths"]
                                            .toString(),
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Recuperados",
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.0),
                                      Text(
                                        snapshot.data["data"]["recovered"]
                                            .toString(),
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Último Boletim " ,
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 6.0),
                                      Text(
                                        _dateFormatted,
                                        style: GoogleFonts.comfortaa(
                                          textStyle: TextStyle(
                                            fontSize: 18.0,
                                            color: Color(0xB3063d61),
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ));
                }
            }
          }),
    );
  }
}
