import 'package:bankauygulamasi/pages/drawerpages/ayarlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/bildirimler.dart';
import 'package:bankauygulamasi/pages/drawerpages/doviz.dart';
import 'package:bankauygulamasi/pages/drawerpages/kartlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/paratransferleri.dart';
import 'package:bankauygulamasi/pages/homepage.dart';
import 'package:bankauygulamasi/pages/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HesapPage extends StatefulWidget {
  const HesapPage({super.key});

  @override
  State<HesapPage> createState() => _HesapPageState();
}

class _HesapPageState extends State<HesapPage> {
  String? veriler;
  @override
  void initState() {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hesaplarım",
          style: TextStyle(color: Colors.black),
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
              },
            ),
            ListTile(
              selected: true,
              selectedTileColor: const Color.fromRGBO(0, 0, 0, 0.1),
              splashColor: Colors.green,
              title: const Text("Hesap"),
              leading: const Icon(Icons.person),
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
      body: Column(
        children: [
          const Divider(height: 1,color: Color.fromRGBO(0, 0, 0, 0.4),),
          SizedBox(
            height: 70,
            child: Row(
              children: [
                const SizedBox(width: 20,),
                const Text("Toplam: ",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      fontSize: 18,
                    )),
                Text(
                  "$veriler TL",
                  style: const TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            ),
          ),
          const Divider(height: 1,color: Color.fromRGBO(0, 0, 0, 0.3),),
          Container(
            margin: const EdgeInsets.only(left: 15,right: 15),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FirebaseAuth.instance.currentUser?.displayName
                          .toString()
                          .toUpperCase() ??
                          "",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    const Text("Cari Hesap",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          fontSize: 14,
                        )),
                  ],
                ),
                Text(
                  "$veriler TL",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            ),
          ),
          const Divider(height: 1,color: Colors.black,),
        ],
      ),
    );
  }
}
