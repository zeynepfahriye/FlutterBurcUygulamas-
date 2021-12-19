import 'package:burc_app/main.dart';
import 'package:burc_app/model/bur_item.dart';
import 'package:burc_app/strings.dart';
import 'package:flutter/material.dart';
import 'model/burc.dart';

void main() {
  runApp(MyApp());
}

class BurcListesi extends StatelessWidget {
  late List<Burc> tumBurclar;
  BurcListesi() {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burçlar Listesi'),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: (context, index) {
          return BurcItem(listelenenBurc: tumBurclar[index],);
        },
        itemCount: tumBurclar.length,
      )),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (int i = 0; i < 12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarih = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      //koc1.png degerini olusturmak için Koc-->koc-->koc1.png
      var burcKucukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '${i + 1}.png';
      //koc_buyuk1.png
      var burcBuyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + '_buyuk'+'${i + 1}.png';
      Burc eklenecekBurc =
          Burc(burcAdi, burcTarih, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}
