import 'package:aplikasi_catatan/catatan.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController judulCtrl = TextEditingController();
  TextEditingController isiCtrl = TextEditingController();
  List<Catatan> listCatatan = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Catatan Pagi"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextField(
                controller: judulCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Judul Catatan",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: isiCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Isi Catatan",
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      judulCtrl.clear();
                      isiCtrl.clear();
                    },
                    child: const Text("Clear"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4CAF50), // Warna hijau
                      foregroundColor: Colors.black87,
                    ),
                    onPressed: () {
                      setState(() {
                        listCatatan.add(
                          Catatan(
                            judul: judulCtrl.text,
                            isi: isiCtrl.text,
                          ),
                        );
                        judulCtrl.clear();
                        isiCtrl.clear();
                      });
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: listCatatan.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(listCatatan[index].judul);
                        print(listCatatan[index].isi);
                        print(listCatatan[index].tglInput);
                      },
                      child: ListTile(
                        leading: const Icon(Icons.event_note_rounded),
                        title: Text(
                          listCatatan[index].judul,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(listCatatan[index].isi),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
