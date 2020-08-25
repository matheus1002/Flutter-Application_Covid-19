import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountriesPage extends StatefulWidget {
  @override
  _CountriesPageState createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  Future<Map> _getStatistics() async {
    http.Response response;
    response = await http
        .get("https://covid19-brazil-api.now.sh/api/report/v1/countries");
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: FutureBuilder(
          future: _getStatistics(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: Text(
                    "Carregando...",
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao carregar os dados",
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: _createStatisticsTable(context, snapshot),
                      ),
                    ],
                  );
                }
            }
          },
        ),
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
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      snapshot.data["data"][index]["country"],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
                Divider(
                    indent: 10.0, color: Color.fromRGBO(255, 255, 255, 1.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Casos",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      snapshot.data["data"][index]["cases"].toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
                Divider(
                    indent: 10.0, color: Color.fromRGBO(255, 255, 255, 1.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Confirmados",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      snapshot.data["data"][index]["confirmed"].toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
                Divider(
                    indent: 10.0, color: Color.fromRGBO(255, 255, 255, 1.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Mortes",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      snapshot.data["data"][index]["deaths"].toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                ),
                Divider(
                    indent: 10.0, color: Color.fromRGBO(255, 255, 255, 1.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Recuperados",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      snapshot.data["data"][index]["recovered"].toString(),
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
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
