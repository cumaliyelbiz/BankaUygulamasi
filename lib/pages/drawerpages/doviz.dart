import 'package:bankauygulamasi/pages/drawerpages/ayarlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/bildirimler.dart';
import 'package:bankauygulamasi/pages/drawerpages/hesap.dart';
import 'package:bankauygulamasi/pages/drawerpages/kartlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/paratransferleri.dart';
import 'package:bankauygulamasi/pages/homepage.dart';
import 'package:bankauygulamasi/pages/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DovizPage extends StatefulWidget {
  const DovizPage({super.key});

  @override
  State<DovizPage> createState() => _DovizPageState();
}

class _DovizPageState extends State<DovizPage> {
  final Stream<QuerySnapshot> dateRef =
      FirebaseFirestore.instance.collection('Kurlar').snapshots();
  final Stream<QuerySnapshot> dateRef2 =
      FirebaseFirestore.instance.collection('Kurlar').snapshots();
  final Stream<QuerySnapshot> dateRef3 =
      FirebaseFirestore.instance.collection('Kurlar').snapshots();
  final _formController = TextEditingController();
  final _formController2 = TextEditingController();
  String dolar = "",
      euro = "",
      altin = "",
      selectedValue = "Dolar",
      selectedValue2 = "TL1",
      selectedValue3 = "Dolar",
      fiyat = "0",
      miktar = "",
      miktar2 = "",
      fiyat2 = "0",
      tlmiktari = "",
      dolarmiktari = "",
      altinmiktari = "",
      euromiktari = "";
  var fiyatliste = [];

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Kullanıcılar")
        .doc(FirebaseAuth.instance.currentUser!.displayName)
        .get()
        .then((gelenVeri) {
      setState(() {
        var response = gelenVeri.data();
        tlmiktari = response?['varliklar'];
        dolarmiktari = response?['Dolar'];
        altinmiktari = response?['Altin'];
        euromiktari = response?['Euro'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Döviz Alış/Satış",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              splashColor: const Color.fromRGBO(150, 150, 150, 1),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Bildirim"),
                        content: const Text("Bildiriminiz Bulunmamaktadır."),
                        actions: [
                          MaterialButton(
                              child: const Text("Kapat"),
                              onPressed: () => Navigator.pop(context))
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black38,
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: const TabBar(
            padding: EdgeInsets.only(right: 100),
            labelColor: Color.fromRGBO(0, 0, 0, 0.4),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: Color.fromRGBO(0, 0, 0, 0.8),
            unselectedLabelColor: Color.fromRGBO(0, 0, 0, 0.6),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            tabs: [
              Tab(
                text: "ALIŞ",
              ),
              Tab(
                text: "SATIŞ",
              ),
              Tab(
                text: "KURLAR",
              ),
            ],
          ),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (_) => const MainPage()));
                              FirebaseAuth.instance.signOut();
                            },
                            icon: const Icon(
                              Icons.exit_to_app,
                              color: Colors.white70,
                            )
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.black26,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser?.displayName
                              .toString()
                              .toUpperCase() ??
                          "",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              ListTile(
                selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
                splashColor: Colors.green,
                title: const Text("Ana Sayfa"),
                leading: const Icon(Icons.home),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
              ),
              ListTile(
                selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
                splashColor: Colors.green,
                title: const Text("Hesap"),
                leading: const Icon(Icons.person),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const HesapPage()));
                },
              ),
              ListTile(
                selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
                splashColor: Colors.green,
                title: const Text("Para Transferleri"),
                leading: const Icon(Icons.compare_arrows),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ParaTransferleriPage()));
                },
              ),
              ListTile(
                selected: true,
                selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
                splashColor: Colors.green,
                title: const Text("Döviz"),
                leading: const Icon(Icons.attach_money),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const DovizPage()));
                },
              ),
              ListTile(
                selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
                splashColor: Colors.green,
                title: const Text("Kartlar"),
                leading: const Icon(Icons.credit_card),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const KartlarPage()));
                },
              ),
              ListTile(
                selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
                splashColor: Colors.green,
                title: const Text("Ayarlar"),
                leading: const Icon(Icons.settings),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const AyarlarPage()));
                },
              ),
              ListTile(
                selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
                splashColor: Colors.green,
                title: const Text("Bildirimler"),
                leading: const Icon(Icons.notifications_outlined),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const BildirimlerPage()));
                },
              ),
              const SizedBox(
                height: 140,
              ),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const MainPage()));
                  FirebaseAuth.instance.signOut();
                },
                child: const Text(
                  "Güvenli Çıkış",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Alış Bölmesi
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _formController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Miktar giriniz",
                      ),
                      onChanged: (value) {
                        setState(() {
                          miktar = value;
                          if (value.isEmpty) {
                            miktar = "0";
                          }
                          if (selectedValue == "Altın") {
                            fiyat = (double.parse(fiyatliste[0]) *
                                    double.parse(miktar))
                                .toString();
                          }
                          if (selectedValue == "Dolar") {
                            fiyat = (double.parse(fiyatliste[1]) *
                                    double.parse(miktar))
                                .toString();
                          }
                          if (selectedValue == "Euro") {
                            fiyat = (double.parse(fiyatliste[2]) *
                                    double.parse(miktar))
                                .toString();
                          }
                        });
                      },
                    ),
                  ),
                  StreamBuilder(
                    stream: dateRef,
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> kurverileri) {
                      if (kurverileri.connectionState ==
                              ConnectionState.waiting ||
                          !kurverileri.hasData) {
                        return const Center(
                          child: Text("Veri Bulanamadı !"),
                        );
                      } else {
                        final alinanVeri = kurverileri.data!.docs;
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
                          const DropdownMenuItem(
                              value: "TL1", child: Text("TL")),
                        ];
                        fiyatliste = [
                          alinanVeri[0]["kurfiyat"],
                          alinanVeri[1]["kurfiyat"],
                          alinanVeri[2]["kurfiyat"]
                        ];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DropdownButton(
                                items: liste,
                                value: selectedValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 150,
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
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (double.parse(tlmiktari) >= double.parse(fiyat)) {
                        if (selectedValue == "Altın") {
                          altinmiktari = (double.parse(altinmiktari) +
                                  double.parse(miktar))
                              .toString();
                          FirebaseFirestore.instance
                              .collection('Kullanıcılar')
                              .doc(FirebaseAuth
                                  .instance.currentUser!.displayName)
                              .update({"Altin": altinmiktari}).then((result) {
                            debugPrint("Altın Alınmıştır");
                          }).catchError((onError) {
                            debugPrint("Hata verdi");
                          });
                        }
                        if (selectedValue == "Dolar") {
                          dolarmiktari = (double.parse(dolarmiktari) +
                                  double.parse(miktar))
                              .toString();
                          FirebaseFirestore.instance
                              .collection('Kullanıcılar')
                              .doc(FirebaseAuth
                                  .instance.currentUser!.displayName)
                              .update({"Dolar": dolarmiktari}).then((result) {
                            debugPrint("Dolar Alınmıştır");
                          }).catchError((onError) {
                            debugPrint("Hata verdi");
                          });
                        }
                        if (selectedValue == "Euro") {
                          euromiktari =
                              (double.parse(euromiktari) + double.parse(miktar))
                                  .toString();
                          FirebaseFirestore.instance
                              .collection('Kullanıcılar')
                              .doc(FirebaseAuth
                                  .instance.currentUser!.displayName)
                              .update({"Euro": euromiktari}).then((result) {
                            debugPrint("Euro Alınmıştır");
                          }).catchError((onError) {
                            debugPrint("Hata verdi");
                          });
                        }
                        tlmiktari =
                            (double.parse(tlmiktari) - double.parse(fiyat))
                                .toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .update({"varliklar": tlmiktari}).then((result) {
                          debugPrint("Para Alınmıştır");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Başarılı"),
                                content: const Text("Döviz hesaba eklenildi."),
                                actions: [
                                  MaterialButton(
                                      child: const Text("Kapat"),
                                      onPressed: () => Navigator.pop(context))
                                ],
                              );
                            });
                      } else {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Hata"),
                                content: const Text(
                                    "Yeterli Paranız Bulunmamaktadır."),
                                actions: [
                                  MaterialButton(
                                      child: const Text("Kapat"),
                                      onPressed: () => Navigator.pop(context))
                                ],
                              );
                            });
                      }
                    },
                    child: const Text("Satın Al"),
                  ),
                  Text("$fiyat TL"),
                ],
              ),
            ),

            //Satış Bölmesi
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: _formController2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Miktar giriniz",
                      ),
                      onChanged: (value) {
                        setState(() {
                          miktar2 = value;
                          if (value.isEmpty) {
                            miktar2 = "0";
                          }
                          if (selectedValue3 == "Altın") {
                            fiyat2 = (double.parse(fiyatliste[0]) *
                                    double.parse(miktar2))
                                .toString();
                          }
                          if (selectedValue3 == "Dolar") {
                            fiyat2 = (double.parse(fiyatliste[1]) *
                                    double.parse(miktar2))
                                .toString();
                          }
                          if (selectedValue3 == "Euro") {
                            fiyat2 = (double.parse(fiyatliste[2]) *
                                    double.parse(miktar2))
                                .toString();
                          }
                        });
                      },
                    ),
                  ),
                  StreamBuilder(
                    stream: dateRef2,
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> kurverileri) {
                      if (kurverileri.connectionState ==
                              ConnectionState.waiting ||
                          !kurverileri.hasData) {
                        return const Center(
                          child: Text("Veri Bulanamadı !"),
                        );
                      } else {
                        final alinanVeri = kurverileri.data!.docs;
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
                          const DropdownMenuItem(
                              value: "TL1", child: Text("TL")),
                        ];
                        fiyatliste = [
                          alinanVeri[0]["kurfiyat"],
                          alinanVeri[1]["kurfiyat"],
                          alinanVeri[2]["kurfiyat"]
                        ];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DropdownButton(
                                items: liste,
                                value: selectedValue3,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValue3 = newValue!;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 150,
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
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedValue3 == "Altın" &&
                          double.parse(altinmiktari) >= double.parse(miktar2)) {
                        altinmiktari =
                            (double.parse(altinmiktari) - double.parse(miktar2))
                                .toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .update({"Altin": altinmiktari}).then((result) {
                          debugPrint("Altın Satılmıştır");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        tlmiktari =
                            (double.parse(tlmiktari) + double.parse(fiyat2))
                                .toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .update({"varliklar": tlmiktari}).then((result) {
                          debugPrint("Para Eklenildi");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Başarılı"),
                                content: const Text("Para hesaba eklenildi."),
                                actions: [
                                  MaterialButton(
                                      child: const Text("Kapat"),
                                      onPressed: () => Navigator.pop(context))
                                ],
                              );
                            });
                      }
                      if (selectedValue3 == "Dolar" &&
                          double.parse(dolarmiktari) >= double.parse(miktar2)) {
                        dolarmiktari =
                            (double.parse(dolarmiktari) - double.parse(miktar2))
                                .toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .update({"Dolar": dolarmiktari}).then((result) {
                          debugPrint("Dolar Satılmıştır");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        tlmiktari =
                            (double.parse(tlmiktari) + double.parse(fiyat2))
                                .toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .update({"varliklar": tlmiktari}).then((result) {
                          debugPrint("Para Eklenildi");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Başarılı"),
                                content: const Text("Para hesaba eklenildi."),
                                actions: [
                                  MaterialButton(
                                      child: const Text("Kapat"),
                                      onPressed: () => Navigator.pop(context))
                                ],
                              );
                            });
                      }
                      if (selectedValue3 == "Euro" &&
                          double.parse(euromiktari) >= double.parse(miktar2)) {
                        euromiktari =
                            (double.parse(euromiktari) - double.parse(miktar2))
                                .toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .update({"Euro": euromiktari}).then((result) {
                          debugPrint("Euro Satılmıştır");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        tlmiktari =
                            (double.parse(tlmiktari) + double.parse(fiyat2))
                                .toString();
                        FirebaseFirestore.instance
                            .collection('Kullanıcılar')
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .update({"varliklar": tlmiktari}).then((result) {
                          debugPrint("Para Eklenildi");
                        }).catchError((onError) {
                          debugPrint("Hata verdi");
                        });
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Başarılı"),
                                content: const Text("Para hesaba eklenildi."),
                                actions: [
                                  MaterialButton(
                                      child: const Text("Kapat"),
                                      onPressed: () => Navigator.pop(context))
                                ],
                              );
                            });
                      }
                    },
                    child: const Text("Sat"),
                  ),
                  Text("$fiyat2 TL"),
                ],
              ),
            ),

            //Kurlar Bölmesi
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: dateRef3,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Bir şeyler ters gitti');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Flexible(
                        child: ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            return ListTile(
                              title: Text(data['kurname']),
                              textColor: Colors.black,
                              subtitle: Text(data['kurfiyat']),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
