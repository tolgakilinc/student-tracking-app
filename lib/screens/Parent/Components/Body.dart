import 'package:flutter/material.dart';

import '../../../constans.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: kEerieBlackColor,
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 160,
          flexibleSpace: FlexibleSpaceBar(
titlePadding: EdgeInsets.all(20),
            title: Text(
              "Veli Bilgilendirme",
              style: TextStyle(fontSize: 18, color:Colors.white, ),
            ),
            centerTitle: false,
            background: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("assets/images/parentControl.png"),fit: BoxFit.contain)),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (_, int index) {
            return ListTile(
              leading: Container(
                  padding: EdgeInsets.all(2), width: 10, ),
              title: Text(
                '${index + 1} : 19.05.2022 : ${"Geçirilen Süre: 3 Dakika"} ',
                textScaleFactor: 1,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          childCount: 30,
        ))
      ],
    );
  }
}
