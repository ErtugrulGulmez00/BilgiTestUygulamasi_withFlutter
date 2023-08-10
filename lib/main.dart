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

  int soruIndex = 0;


  List<Soru> soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir', soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememişti',
        soruYaniti: true),
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
                soruBankasi[soruIndex].soruMetni,
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
                        padding: EdgeInsets.all(12),
                        backgroundColor: Colors.red[400],
                      ),
                      onPressed: () {
                        bool dogruYanit = soruBankasi[soruIndex].soruYaniti;
                        setState(() {
                          if (dogruYanit == false) {
                            secimSonucuIconlari.add(kDogruIconu);
                          } else {
                            secimSonucuIconlari.add(kYanlisIconu);
                          }
                          if( soruIndex == 5) {soruIndex=0;}

                          soruIndex++;
                          // secimSonucuIconlari.add(kYanlisIconu);
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
                        bool dogruYanit = soruBankasi[soruIndex].soruYaniti;
                        setState(() {
                          if (dogruYanit == true) {
                            secimSonucuIconlari.add(kDogruIconu);
                          } else {
                            secimSonucuIconlari.add(kYanlisIconu);
                          }
                          if( soruIndex == 5) {soruIndex=0;}
                          soruIndex++;
                          // secimSonucuIconlari.add(kDogruIconu);
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

class Soru {
  String soruMetni;
  bool soruYaniti;

// Constructer ataması o objeye default olmayan özel verileri atamamıza yardımcı olur.

  Soru({required this.soruMetni, required this.soruYaniti});
}
