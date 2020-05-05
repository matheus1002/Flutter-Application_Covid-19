import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recommendation extends StatefulWidget {
  @override
  _RecommendationState createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xB3063d61),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Recomendações",
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: 300.0,
                        height: 40.0,
                        child: AutoSizeText(
                          "Atualmente, não há uma vacina para prevenir o coronavírus (COVID-19).",
                          maxLines: 4,
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                              fontSize: 18.0,
                              color: Color(0xB3063d61),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          _CardRecommedation(
              'Lave com frequência as mãos até a altura dos punhos, com água e sabão, ou então higienize com álcool em gel 70%.',
              300.0,
              100.0,
              5),
          _CardRecommedation(
              'Ao tossir ou espirrar, cubra nariz e boca com lenço ou com o braço, e não com as mãos.',
              300.0,
              60.0,
              4),
          _CardRecommedation(
              'Evite tocar olhos, nariz e boca com as mãos não lavadas.',
              300.0,
              40.0,
              4),
          _CardRecommedation('Ao tocar, lave sempre as mãos como já indicado.',
              300.0, 40.0, 4),
          _CardRecommedation(
              'Mantenha uma distância mínima de cerca de 2 metros de qualquer pessoa tossindo ou espirrando.',
              300.0,
              80.0,
              4),
          _CardRecommedation(
              'Evite abraços, beijos e apertos de mãos. Adote um comportamento amigável sem contato físico, mas sempre com um sorriso no rosto.',
              300.0,
              100.0,
              5),
          _CardRecommedation(
              'Higienize com frequência o celular e os brinquedos das crianças.',
              300.0,
              60.0,
              4),
          _CardRecommedation(
              'Não compartilhe objetos de uso pessoal, como talheres, toalhas, pratos e copos.',
              300.0,
              60.0,
              4),
          _CardRecommedation(
              'Mantenha os ambientes limpos e bem ventilados.', 300.0, 40.0, 4),
          _CardRecommedation(
              'Evite circulação desnecessária nas ruas, estádios, teatros, shoppings, shows, cinemas e igrejas. Se puder, fique em casa.',
              300.0,
              100.0,
              5),
          _CardRecommedation(
              'Se estiver doente, evite contato físico com outras pessoas, principalmente idosos e doentes crônicos, e fique em casa até melhorar.',
              300.0,
              100.0,
              5),
          _CardRecommedation(
              'Durma bem e tenha uma alimentação saudável.', 300.0, 40.0, 4),
          _CardRecommedation(
              'Utilize máscaras caseiras ou artesanais feitas de tecido em situações de saída de sua residência. ',
              300.0,
              80.0,
              4),
        ],
      ),
    );
  }

  Widget _CardRecommedation(
      String _text, double _width, double _height, int _maxLines) {
    return Card(
      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: _width,
                  height: _height,
                  child: AutoSizeText(
                    _text,
                    maxLines: _maxLines,
                    style: GoogleFonts.comfortaa(
                      textStyle: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xB3063d61),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
