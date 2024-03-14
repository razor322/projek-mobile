import 'dart:js';

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> listDevice = ['iphone', 'ipad', 'android', 'laptop'];
  bool isCari = false;
  List<String> filterData = [];
  TextEditingController txtcari = TextEditingController();

  _SearchPageState() {
    txtcari.addListener(() {
      if (txtcari.text.isEmpty) {
        setState(() {
          isCari = true;
          txtcari.text = '';
        });
      } else {
        setState(() {
          isCari = false;
          txtcari.text != "";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search list"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextFormField(
            controller: txtcari,
            decoration: InputDecoration(
              hintText: "Search",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Colors.green.withOpacity(0.1),
            ),
          ),
          isCari
              ? Expanded(
                  child: ListView.builder(
                    itemCount: listDevice.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listDevice[index]),
                      );
                    },
                  ),
                )
              : createFilterList()
        ]),
      ),
    );
  }

  Widget createFilterList() {
    filterData = [];
    for (int i = 0; i < listDevice.length; i++) {
      var item = listDevice[i];
      if (item.toLowerCase().contains(txtcari.text.toLowerCase())) {
        filterData.add(item);
      }
    }
    return HasilSearch();
  }

  Widget HasilSearch() {
    return Expanded(
      child: ListView.builder(
        itemCount: filterData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filterData[index]),
          );
        },
      ),
    );
  }
}
