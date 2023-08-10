import 'package:bilgi_testi/pages/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List <String> sorular=[
    'litanic gelmiş geçmiş en büyük gemidir',
    'Dünyadaki tavuk sayısı insan sayısından fazladır',
    'Kelebeklerin ömrü bir gündür',
    'Dünya düzdür' ,
    'Kaju fıstığı aslında bir meyvenin sapıdır',
    'Fatih Sultan Mehmet hiç patates yememişti'
  ];
  List<Widget> secimSonucuIconlari = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Bilgi Testi Soruları',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(

          spacing: 5,
          runSpacing: 5,
          children: secimSonucuIconlari,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12), backgroundColor: Colors.red[400],
                      ),
                      onPressed: () {
                        setState(() {
                          secimSonucuIconlari.add(kYanlisIconu);
                        });
                      },
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(12),
                        backgroundColor: Colors.green[400],
                      ),
                      onPressed: () {
                        setState(() {
                          secimSonucuIconlari.add(kDogruIconu);
                        });
                      },
                      child: Icon(
                        Icons.thumb_up,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
