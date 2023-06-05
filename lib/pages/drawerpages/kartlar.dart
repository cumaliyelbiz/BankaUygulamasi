import 'package:bankauygulamasi/pages/drawerpages/ayarlar.dart';
import 'package:bankauygulamasi/pages/drawerpages/bildirimler.dart';
import 'package:bankauygulamasi/pages/drawerpages/doviz.dart';
import 'package:bankauygulamasi/pages/drawerpages/hesap.dart';
import 'package:bankauygulamasi/pages/homepage.dart';
import 'package:bankauygulamasi/pages/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'paratransferleri.dart';

class KartlarPage extends StatefulWidget {
  const KartlarPage({super.key});

  @override
  State<KartlarPage> createState() => _KartlarPageState();
}

class _KartlarPageState extends State<KartlarPage> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kartlarım",
          style: TextStyle(color: Colors.black,),
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
              selected: true,
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
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const BildirimlerPage()));
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
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Toplam Kullanılabilir Limit: ",
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 15,
                  ),
                ),
                Text(
                  "0,00 TL",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Toplam Harcamalar: ",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontSize: 15,
                      height: 2),
                ),
                Text(
                  "0,00 TL",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    height: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              height: 1,
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            ExpansionPanelList(
              animationDuration: const Duration(milliseconds: 750),
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  expanded = !expanded;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded){
                    return const ListTile(
                      title: Text("Banka Kartlarım",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                    );
                  },
                  body: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(76, 175, 80, 0.85),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 190,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.all(15),
                    child: Container(
                      margin: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "X Bank",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 22),
                              ),
                              Text("Kredi Kartı",
                                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold,fontSize: 18),
                              ),
                            ],
                          ),
                          const Text("1234 **** **** 5678",
                            style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(FirebaseAuth.instance.currentUser!.displayName.toString().toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white, fontSize: 16,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                alignment: Alignment.center,
                                height: 30,
                                width: 50,
                                child: const Text("X Bank",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  isExpanded: expanded,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
