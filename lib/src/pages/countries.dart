import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  //String _search;

  Future<Map> _getStatistics() async {
    http.Response response;

    //if (_search == null)
      response = await http
          .get("https://covid19-brazil-api.now.sh/api/report/v1/countries");
    //else
      //response = await http
          //.get("https://covid19-brazil-api.now.sh/api/report/v1/brazil");

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
                return _createStatisticsTable(context, snapshot);
                /*return Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: Theme(
                        data: ThemeData(
                          primaryColor: Colors.white,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Pesquise Aqui!",
                            labelStyle: TextStyle(
                              color: Colors.white,
                              decorationColor: Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                          onSubmitted: (text) {
                            setState(() {
                              _search = text;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: _createStatisticsTable(context, snapshot),
                    ),
                  ],
                );*/
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
                      "País",
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
                      snapshot.data["data"][index]["country"],
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
                      "Confirmados",
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
                      snapshot.data["data"][index]["confirmed"].toString(),
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
                      "Recuperados",
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
                      snapshot.data["data"][index]["recovered"].toString(),
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
