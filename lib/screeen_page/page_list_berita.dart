// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:modul/model/model_berita.dart';
import 'package:modul/screeen_page/page_login.dart';
import 'package:modul/utils/cek_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageListBerita extends StatefulWidget {
  const PageListBerita({super.key});

  @override
  State<PageListBerita> createState() => _PageListBeritaState();
}

class _PageListBeritaState extends State<PageListBerita> {
  String? id, username;
  Future<List<Datum>?> getBerita() async {
    try {
      http.Response res = await http
          .get(Uri.parse('http://192.168.14.79/beritaDb/getBerita.php'));
      return modelBeritaFromJson(res.body).data;
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  Future getSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      id = pref.getString("id") ?? '';
      username = pref.getString("username") ?? '';
      print('id ${id}');
      print('user ${username}');
    });
    // prri
  }

  @override
  void initState() {
    // TODO: implement initState
    getBerita();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Berita"),
        backgroundColor: Colors.orange,
        actions: [
          Text("Hi.. $id"),
          IconButton(
              onPressed: () {
                setState(() {
                  session.clearSession();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => PageLogin()),
                      (route) => false);
                });
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: FutureBuilder(
          future: getBerita(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
            //cek apabila ada data
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Datum? data = snapshot.data?[index];
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageDetailBerita(
                                        data,
                                      )));
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  child: Image.network(
                                    'http://192.168.14.79/beritaDb/gambar_berita/${data?.gambarBerita}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '${data?.judul}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                                subtitle: Text(
                                  '${data?.isiBerita}',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black54),
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          }),
    );
  }
}

class PageDetailBerita extends StatelessWidget {
  final Datum? data;
  // id =  session.getSessionIdUser();
  const PageDetailBerita(
    this.data,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Berita'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4, top: 4, right: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                'http://192.168.14.79/beritaDb/gambar_berita/${data?.gambarBerita}',
                fit: BoxFit.contain,
              ),
            ),
          ),
          ListTile(
            title: Text(
              data?.judul ?? "",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            subtitle:
                Text(DateFormat().format(data?.tglBerita ?? DateTime.now())),
            trailing: const Icon(
              Icons.star,
              color: Colors.red,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
            child: Text(
              data?.isiBerita ?? "",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              // textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
