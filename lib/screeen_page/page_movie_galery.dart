import 'package:flutter/material.dart';

class PageMovie extends StatefulWidget {
  const PageMovie({super.key});

  @override
  State<PageMovie> createState() => _PageMovieState();
}

class _PageMovieState extends State<PageMovie> {
  @override
  List<Map<String, dynamic>> ListMovie = [
    {"judul": "Ancika", "gambar": "film1.jpg", "harga": "Rp. 45.000"},
    {
      "judul": "13 Bom di Jakarta",
      "gambar": "film1.jpg",
      "harga": "Rp. 45.000"
    },
    {"judul": "Diew", "gambar": "film1.jpg", "harga": "Rp. 45.000"},
    {
      "judul": "Pulang tak harus rumah",
      "gambar": "film5.jpg",
      "harga": "Rp. 45.000"
    },
    {"judul": "Sehidup Semati", "gambar": "film3.jpg", "harga": "Rp. 45.000"},
    {"judul": "The Beekeeper", "gambar": "film4.jpg", "harga": "Rp. 45.000"},
    {
      "judul": "Jatuh Cinta Seperti di film-film",
      "gambar": "film7.jpg",
      "harga": "Rp. 45.000"
    },
    {
      "judul": "Air mata ujung sajadah",
      "gambar": "film8.jpg",
      "harga": "Rp. 45.000"
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green, title: Text("Movie App - Gallery")),
      body: GridView.builder(
          itemCount: ListMovie.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PageDetailMovie(
                              '${ListMovie[index]['judul']}',
                              '${ListMovie[index]['harga']}',
                              '${ListMovie[index]['gambar']}',
                            )));
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: GridTile(
                  footer: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black54),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${ListMovie[index]['judul']}',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${ListMovie[index]['harga']}',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  child: Image.asset(
                    'gambar/${ListMovie[index]['gambar']}',
                    fit: BoxFit.contain,
                    height: 185,
                    width: 185,
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class PageDetailMovie extends StatelessWidget {
  final String itemJudul, itemHarga, itemGambar;
  const PageDetailMovie(this.itemJudul, this.itemHarga, this.itemGambar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${itemJudul}"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'gambar/${itemGambar}',
                  fit: BoxFit.contain,
                ),
                Text(
                  "Harga : ${itemHarga}",
                  style: TextStyle(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
