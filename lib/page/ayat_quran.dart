import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class Ayat extends StatelessWidget {
  final String surat;
  final String ayat;

  const Ayat({
    Key? key,
    required this.surat,
    required this.ayat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quran.getSurahName(int.parse(surat)) +
            "   ( " +
            quran.getSurahNameArabic(int.parse(surat)) +
            " )"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: ListView.builder(
            itemCount: int.parse(ayat),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  quran.getVerse(int.parse(surat), index + 1,
                      verseEndSymbol: false),
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 35),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
