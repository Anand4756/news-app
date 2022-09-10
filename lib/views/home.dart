import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List list = [];

  _readdata() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/categories.json")
        .then((value) => setState(() => list = json.decode(value)));
    print(list);
  }

  void initState() {
    _readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Categorytile(
                    imageurl: list[index]['imageurl'],
                    categoryname: list[index]['title'],
                  );
                },
                // ListTile(title: Text(list[index]['title']));
                // children: [
                //   Categorytile(),
                //   Categorytile(),
                //   Categorytile(),
                //   Categorytile(),
                //   Categorytile()
                // ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class Categorytile extends StatelessWidget {
  final imageurl, categoryname;

  const Categorytile({required this.imageurl, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 18.0),
      child: Container(
          child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image.network(imageurl, width: 90.0),
        ),
        Text(categoryname),
      ])),
    );
  }
}
