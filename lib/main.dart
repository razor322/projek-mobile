import 'package:flutter/material.dart';
import 'package:modul/screeen_page/page_gallery.dart';
import 'package:modul/screeen_page/page_list_berita.dart';
import 'package:modul/screeen_page/page_list_user.dart';
import 'package:modul/screeen_page/page_login.dart';
import 'package:modul/screeen_page/page_movie_galery.dart';
import 'package:modul/screeen_page/page_register.dart';
import 'package:modul/screeen_page/page_registration.dart';
import 'package:modul/screeen_page/search_listdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          // PageRegistration(),
          PageLogin(),
          PageMovie(),
          // SearchPage(),
          // PageListUser()
          PageListBerita()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          isScrollable: true,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          controller: tabController,
          tabs: [
            Tab(
              text: "Form Registration",
              icon: Icon(Icons.input),
            ),
            Tab(
              text: "Gallery Photo",
              icon: Icon(Icons.photo_album),
            ),
            Tab(
              text: "News",
              icon: Icon(Icons.list),
            ),
          ],
        ),
      ),
    );
  }
}

class PageTabView extends StatelessWidget {
  const PageTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Form register"),
      ),
      body: Center(
        child: Text("ini halaman setelah di klik"),
      ),
    );
  }
}
