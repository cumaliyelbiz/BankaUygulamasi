import 'package:bankauygulamasi/pages/navbarpages/hesaplapage.dart';
import 'package:bankauygulamasi/pages/navbarpages/kurlarpage.dart';
import 'package:bankauygulamasi/pages/navbarpages/musteriol.dart';
import 'package:flutter/material.dart';

class DahaFazlaPage extends StatefulWidget{
  const DahaFazlaPage({super.key});

  @override
  State<DahaFazlaPage> createState() => _DahaFazlaPageState();
}

class _DahaFazlaPageState extends State<DahaFazlaPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daha Fazla"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              MaterialButton(
                padding: const EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const KurlarPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                        Icons.currency_exchange,
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Kurlar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black, height: 1,),
              MaterialButton(
                padding: const EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HesaplaPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.calculate,
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Hesapla",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black, height: 1,),
              MaterialButton(
                padding: const EdgeInsets.all(8.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MusteriOlPage()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.person_add_alt_outlined,
                      size: 40,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Müşteri Ol",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black, height: 1,),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.phone,
                    size: 45,
                  ),
                  Text("İletişim Bilgisi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("+90 XXX XXX XX XX"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}