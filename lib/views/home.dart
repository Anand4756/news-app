import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [Categorytile(), Categorytile(), Categorytile()],
          ),
        ));
  }
}

class Categorytile extends StatelessWidget {
  final imageurl, categoryname;
  const Categorytile({Key? key, this.imageurl, this.categoryname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(children: [
      Image.network(
        'https://images.pexels.com/photos/3408744/pexels-photo-3408744.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        height: 150.0,
      ),
      Text("hii"),
    ]));
  }
}
