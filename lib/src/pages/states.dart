import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {

  /*
  Future<int> _getRecovered() async {
    http.Response response;
    response = await http.get("https://covid19-brazil-api.now.sh/api/report/v1/brazil");
    var resBody = json.decode(response.body);

    double _confirmed = resBody["data"]["confirmed"].toDouble();
    double _recovered = resBody["data"]["recovered"].toDouble();
    double _percentRecovered = ((_recovered * 100) / _confirmed);

    return _percentRecovered.toInt();
  }
  */

  Future<Map> _getStatistics() async {
    http.Response response;
    response =
        await http.get("https://covid19-brazil-api.now.sh/api/report/v1");
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
                //return _createStatisticsTable(context, snapshot);
                return Column(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "País",
                                  style: GoogleFonts.comfortaa(
                                    textStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xB3063d61),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  "Brasil",
                                  style: GoogleFonts.comfortaa(
                                    textStyle: TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xB3063d61),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            /*
                            Divider(
                              color: Colors.white,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.cached,
                                  color: Color(0xB3063d61),
                                  size: 32.0,
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  _getRecovered().toString() + "%",
                                  style: GoogleFonts.comfortaa(
                                    textStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Color(0xB3063d61),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),*/
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: _createStatisticsTable(context, snapshot),
                    ),
                  ],
                );
              }
          }
        },
      ),
    );
  }

  Widget _createStatisticsTable(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: snapshot.data["data"].length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Estado",
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      snapshot.data["data"][index]["state"],
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Casos",
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      snapshot.data["data"][index]["cases"].toString(),
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Mortes",
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      snapshot.data["data"][index]["deaths"].toString(),
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Suspeitos",
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      snapshot.data["data"][index]["suspects"].toString(),
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Descartados",
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xB3063d61),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      snapshot.data["data"][index]["refuses"].toString(),
                      style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(
                          fontSize: 16.0,
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
        );
      },
    );
  }
}
