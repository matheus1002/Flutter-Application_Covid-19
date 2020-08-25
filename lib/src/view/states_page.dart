import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatePage extends StatefulWidget {
  @override
  _StatePageState createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  Future<Map> _getStatistics() async {
    http.Response response;
    response =
        await http.get("https://covid19-brazil-api.now.sh/api/report/v1");
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      snapshot.data["data"][index]["state"],
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
                      "Suspeitos",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      snapshot.data["data"][index]["suspects"].toString(),
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
                      "Descartados",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Text(
                      snapshot.data["data"][index]["refuses"].toString(),
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
