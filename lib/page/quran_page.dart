import 'dart:convert';
import 'package:bacaan_sholat/model/model_nama_surat.dart';
import 'package:bacaan_sholat/model/model_quran.dart';
import 'package:bacaan_sholat/page/ayat_quran.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:quran/quran.dart' as quran;
import 'package:quran/translations/en_saheeh.dart' as enSaheeh;

class Quran extends StatefulWidget {
  const Quran({Key? key}) : super(key: key);

  @override
  _QuranState createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  Future<List<ModelNamaSurat>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString("assets/data/namasurat.json");
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => ModelNamaSurat.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0e1446),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff44aca0)),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        margin: EdgeInsets.only(top: 120, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Surat Pendek",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Surat Pendek Juz 30",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      "assets/images/bg_doa.png",
                      width: 330,
                      height: 200,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                child: FutureBuilder(
                  future: ReadJsonData(),
                  builder: (context, data) {
                    if (data.hasError) {
                      return Center(child: Text("${data.error}"));
                    } else if (data.hasData) {
                      var surat = data.data as List<ModelNamaSurat>;
                      return ListView.builder(
                          itemCount: surat == null ? 0 : surat.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.white,
                              elevation: 5,
                              margin: EdgeInsets.all(15),
                              child: Expanded(
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Text("( " +
                                          surat[index].name.toString() +
                                          " )"),
                                      Text(
                                        surat[index]
                                            .transliteration_en
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Ayat(
                                                  surat: surat[index]
                                                      .number
                                                      .toString(),
                                                  ayat: surat[index]
                                                      .total_verses
                                                      .toString(),
                                                )));
                                  },
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
