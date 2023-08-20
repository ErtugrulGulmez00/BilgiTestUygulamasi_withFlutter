import 'package:bilgi_testi/pages/constants.dart';
import 'package:flutter/material.dart';
import 'package:bilgi_testi/pages/veri.dart';

void main() => runApp(const BilgiTesti());

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: const SafeArea(
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
  const SoruSayfasi({super.key});

  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimSonucuIconlari = [];

  void butonFonksiyonu(bool secilenButon) {
    if (veri_1.testBittimi() == true) {
      //alert dialog gösterilecek
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Tebrikler testi bitirdiniz"),
            content: const Text("Bütün sorulara cevap verildi"),
            actions: <Widget>[
              TextButton(
                child: const Text("Başa dön"),
                onPressed: () {
                  setState(() {
                    //indexi 0 a eşitle
                    veri_1.indexSifirlama();

                    //secimleri sıfırla
                    secimSonucuIconlari = [];
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        bool dogruYanit = veri_1.getSoruYaniti();
        if (dogruYanit == secilenButon) {
          secimSonucuIconlari.add(kDogruIconu);
        } else {
          secimSonucuIconlari.add(kYanlisIconu);
        }
        veri_1.sonrakiSoruDuzeltme();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/background.jpg', // Resmin yolunu uygun şekilde belirtin
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    veri_1.getSoruMetni(),
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
                            butonFonksiyonu(false);
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
                            butonFonksiyonu(true);
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
        ),
      ],
    );
  }
}

Veriler veri_1 = Veriler();
