import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HesaplaPage extends StatefulWidget {
  const HesaplaPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HesaplaPageState createState() => _HesaplaPageState();
}

class _HesaplaPageState extends State<HesaplaPage> {
  String selectedValue1 = "Dolar";
  String selectedValue2 = "TL1";
  num sonuc = 0;
  num deger1 = 0;
  num deger2 = 0;
  var fiyatliste = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesapla"),
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Kurlar").snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot> veriTabanindanGelenVeriler) {
              if (veriTabanindanGelenVeriler.connectionState ==
                      ConnectionState.waiting ||
                  !veriTabanindanGelenVeriler.hasData) {
                return const Center(
                  child: Text("Veri Yok"),
                );
              } else {
                final alinanVeri = veriTabanindanGelenVeriler.data!.docs;
                List<DropdownMenuItem<String>> liste = [];
                liste = [
                  DropdownMenuItem(
                      value: alinanVeri[0]["kurname"],
                      child: Text(alinanVeri[0]["kurname"])),
                  DropdownMenuItem(
                      value: alinanVeri[1]["kurname"],
                      child: Text(alinanVeri[1]["kurname"])),
                  DropdownMenuItem(
                      value: alinanVeri[2]["kurname"],
                      child: Text(alinanVeri[2]["kurname"])),
                ];
                List<DropdownMenuItem<String>> liste2 = [];
                liste2 = [
                  const DropdownMenuItem(value: "TL1", child: Text("TL")),
                ];
                fiyatliste = [
                  alinanVeri[0]["kurfiyat"],
                  alinanVeri[1]["kurfiyat"],
                  alinanVeri[2]["kurfiyat"]
                ];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DropdownButton(
                            items: liste,
                            value: selectedValue1,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue1 = newValue!;
                                debugPrint(selectedValue1);
                              });
                            },
                          ),
                          const SizedBox(
                            width: 230,
                          ),
                          DropdownButton(
                            items: liste2,
                            value: selectedValue2,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue2 = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    labelText: selectedValue1,
                    hintText: "Değer giriniz",
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      switch (selectedValue1) {
                        case "Dolar":
                          deger1 = num.parse(value);
                          deger2 = double.parse(fiyatliste[1]);
                          sonuc = deger1 * deger2;
                          break;
                        case "Altın":
                          deger1 = num.parse(value);
                          deger2 = double.parse(fiyatliste[0]);
                          sonuc = deger1 * deger2;
                          break;
                        case "Euro":
                          deger1 = num.parse(value);
                          deger2 = double.parse(fiyatliste[2]);
                          sonuc = deger1 * deger2;
                          break;
                      }
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    labelText: sonuc.toString(),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
