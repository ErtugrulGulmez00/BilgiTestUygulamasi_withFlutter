import 'package:bilgi_testi/pages/constants.dart';

import 'package:flutter/material.dart';
import 'package:bilgi_testi/pages/veri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                veri_1.soruBankasi[soruIndex].soruMetni,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.red[400],
                      ),
                      onPressed: () {
                        bool dogruYanit = veri_1.soruBankasi[soruIndex].soruYaniti;
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
                      child: const Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),
                        backgroundColor: Colors.green[400],
                      ),
                      onPressed: () {
                        bool dogruYanit = veri_1.soruBankasi[soruIndex].soruYaniti;
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
                      child: const Icon(
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

Veriler veri_1=Veriler();