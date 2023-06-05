import 'package:bankauygulamasi/pages/drawerpages/ayarlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/bildirimler.dart';
import 'package:bankauygulamasi/pages/drawerpages/doviz.dart';
import 'package:bankauygulamasi/pages/drawerpages/hesap.dart';
import 'package:bankauygulamasi/pages/drawerpages/kartlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/paratransferleri.dart';
import 'package:bankauygulamasi/pages/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> headers = generateItems(4);
  String? veriler, dolar, altin, euro;
  CollectionReference makineListesi =
      FirebaseFirestore.instance.collection('makineListesi');
  final Stream<QuerySnapshot> dateRef =
      FirebaseFirestore.instance.collection('Kullanıcılar').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "                 X Bank",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
              /*
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BildirimPage(),
                ),
              );
               */
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
              selected: true,
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Ana Sayfa"),
              leading: const Icon(Icons.home),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HesapPage()));
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ParaTransferleriPage()));
              },
            ),
            ListTile(
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Döviz"),
              leading: const Icon(Icons.attach_money),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DovizPage()));
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const KartlarPage()));
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AyarlarPage()));
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const BildirimlerPage()));
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                  "Merhaba ${FirebaseAuth.instance.currentUser?.displayName.toString().toUpperCase()}"),
              ////
              ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 750),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    headers[index].isExpanded = !isExpanded;
                  });
                },
                children: [
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      if (FirebaseAuth.instance.currentUser != null) {
                        FirebaseFirestore.instance
                            .collection("Kullanıcılar")
                            .doc(FirebaseAuth.instance.currentUser!.displayName)
                            .get()
                            .then((gelenVeri) {
                          setState(() {
                            var response = gelenVeri.data();
                            veriler = response?['varliklar'];
                          });
                        });
                      }
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black38,
                          radius: 15,
                          child: Icon(Icons.currency_lira, color: Colors.white),
                        ),
                        title: Text(headers[0].headerValue),
                      );
                    },
                    body: Container(
                      padding: const EdgeInsets.all(2),
                      alignment: Alignment.topRight,
                      height: 122,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("Toplam",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                fontSize: 17,
                              )),
                          Text(
                            veriler.toString(),
                            style: const TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 35),
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.black,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 56,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HesapPage()));
                                  },
                                  child: const Text(
                                    "DAHA FAZLA",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isExpanded: headers[0].isExpanded,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black38,
                          radius: 15,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(headers[1].headerValue),
                      );
                    },
                    body: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(2),
                      height: 122,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser?.displayName
                                    .toString()
                                    .toUpperCase() ??
                                "",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 25,
                              height: 2,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("Toplam Kullanılabilir Bakiye",
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                        fontSize: 17,
                                      )),
                                  Text(
                                    "$veriler TL",
                                    style: const TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35),
                                  ),
                                  const Text("Cari Hesap",
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                        fontSize: 17,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isExpanded: headers[1].isExpanded,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black38,
                          radius: 15,
                          child: Icon(Icons.credit_card, color: Colors.white),
                        ),
                        title: Text(headers[2].headerValue),
                      );
                    },
                    body: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: const [
                                  Text("Kullanılabilir Limit",
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                        fontSize: 17,
                                      )),
                                  Text(
                                    "0,00 TL",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35),
                                  ),
                                  Text("Toplam Harcamalar",
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                        fontSize: 17,
                                      )),
                                  Text(
                                    "0,00",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35),
                                  ),
                                  Text("(TL Karşılığı)",
                                      style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                        fontSize: 17,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.all(12),
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          const Divider(
                            height: 1,
                            color: Colors.black38,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.credit_card,
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                size: 35,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Kredi Kartı",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.5),
                                        fontSize: 22),
                                  ),
                                  Text(
                                    "1234 **** **** 5678",
                                    style: TextStyle(
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isExpanded: headers[2].isExpanded,
                  ),
                  ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      FirebaseFirestore.instance
                          .collection("Kullanıcılar")
                          .doc(FirebaseAuth.instance.currentUser!.displayName)
                          .get()
                          .then((gelenVeri) {
                        setState(() {
                          var response = gelenVeri.data();
                          veriler = response?['varliklar'];
                          dolar = response?['Dolar'];
                          euro = response?['Euro'];
                          altin = response?['Altin'];
                        });
                      });
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black38,
                          radius: 15,
                          child: Icon(Icons.attach_money, color: Colors.white),
                        ),
                        title: Text(headers[3].headerValue),
                      );
                    },
                    body: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "TL",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    veriler.toString(),
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Dolar",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    dolar.toString(),
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Euro",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    euro.toString(),
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Altın",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    altin.toString(),
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            height: 15,
                            color: Colors.black,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 56,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const DovizPage()));
                                  },
                                  child: const Text(
                                    "Finans İşlemleri",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    isExpanded: headers[3].isExpanded,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  var headers = ['Varlıklarım', 'Hesabım', 'Kartlarım', 'Finansmanlarım'];
  return List<Item>.generate(4, (int index) {
    return Item(
      headerValue: headers[index],
      expandedValue: 'Açıklama',
    );
  });
}
