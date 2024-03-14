// ignore_for_file: unnecessary_brace_in_string_interps, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:modul/model/model_user.dart';
import 'package:http/http.dart' as http;

class PageListUser extends StatefulWidget {
  const PageListUser({super.key});

  @override
  State<PageListUser> createState() => _PageListUserState();
}

class _PageListUserState extends State<PageListUser> {
  bool isLoading = true;
  List<ModelUser> listUser = [];

  Future getUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      var data = jsonDecode(response.body);

      setState(() {
        for (Map<String, dynamic> i in data) {
          listUser.add(ModelUser.fromJson(i));
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("List data user"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: listUser.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageDetailUser(
                                  listUser[index].name ?? "",
                                  listUser[index].email ?? "",
                                  listUser[index].username ?? "",
                                  listUser[index].phone ?? "",
                                  listUser[index].website ?? "",
                                  listUser[index].address.street ?? "",
                                  listUser[index].address.suite ?? "",
                                  listUser[index].address.city ?? "",
                                  listUser[index].address.zipcode ?? "",
                                  listUser[index].company.name ?? "",
                                  listUser[index].company.catchPhrase ?? "")));
                    },
                    title: Text(
                      listUser[index].name ?? "",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listUser[index].email ?? ""),
                        Text(listUser[index].address.street ?? ""),
                        Text('Company ${listUser[index].company}' ?? ""),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class PageDetailUser extends StatelessWidget {
  final itemNama,
      itemEmail,
      itemUsername,
      itemPhone,
      itemWebsite,
      street,
      suite,
      city,
      zipcode,
      itemCompany,
      itemCompanyAddres;
  const PageDetailUser(
    this.itemNama,
    this.itemEmail,
    this.itemUsername,
    this.itemPhone,
    this.itemWebsite,
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.itemCompany,
    this.itemCompanyAddres,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Detail User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "berikut ini adalah detail user",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              "Nama : ${itemNama}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),
            ),
            Text(
              "Email : ${itemEmail}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              "Username : ${itemUsername}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              "Phone : ${itemPhone}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              "Website : ${itemWebsite}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Alamat : \n$street, $suite, $city, $zipcode ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              "Company : \n${itemCompany}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              "Alamat : \n${itemCompanyAddres}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
