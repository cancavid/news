import 'package:euronews/components/widgets.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPost extends StatelessWidget {
  String title;
  String image;
  MainPost({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyCachedImage(image: image),
          Container(
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 15.0),
            decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
                border: Border(bottom: BorderSide(color: Color(0xFFDDDDDD)))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 5.0,
                  width: 50.0,
                  color: Colors.blue,
                  margin: EdgeInsets.only(bottom: 15.0),
                ),
                Text(title,
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
                Container(
                    color: Colors.blue,
                    margin: EdgeInsets.only(top: 15.0),
                    padding: EdgeInsets.all(5.0),
                    child: Text('Gündəm'.toUpperCase(),
                        style: TextStyle(color: Colors.white)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
