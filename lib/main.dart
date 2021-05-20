import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Uygulama Arayüzü',
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Uygulaması'),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();

  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenMesaj) {
    if (gelenMesaj != '') {
      setState(() {
        MesajBalonu mesajNesnesi = MesajBalonu(
          mesaj: gelenMesaj,
        );
        mesajListesi.insert(0, mesajNesnesi);
        t1.clear();
      });
    }
  }

  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(15),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: t1,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => listeyeEkle(t1.text),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: mesajListesi.length,
                itemBuilder: (_, indexNo) => mesajListesi[indexNo]),
          ),
          Divider(
            thickness: 1,
          ),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = 'Kullanıcı1';

class MesajBalonu extends StatelessWidget {
  String mesaj;

  MesajBalonu({this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(
            children: [
              Text(isim),
              Text(mesaj),
            ],
          ),
        ],
      ),
    );
  }
}
