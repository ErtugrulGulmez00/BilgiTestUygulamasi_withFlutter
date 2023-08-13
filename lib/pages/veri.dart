import 'package:bilgi_testi/pages/soru.dart';

class Veriler {
  int _soruIndex = 0;
  final List<Soru> _soruBankasi = [
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
  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;

}
 bool getSoruYaniti(){
    return _soruBankasi[_soruIndex].soruYaniti;


}
   sonrakiSoruDuzeltme (){
    if( _soruIndex == 5) {_soruIndex=0;}

    _soruIndex++;
    return;
  }
  bool testBittimi(){
    if(_soruIndex==5){

      return true;

    }else{
      return false;
    }

  }
  void indexSifirlama(){
    _soruIndex=0;
  }
}