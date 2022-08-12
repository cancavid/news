import 'dart:convert';

import 'package:euronews/classes/posts/main_post.dart';
import 'package:euronews/components/appbar.dart';
import 'package:euronews/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List posts = [];
  String statustext = '';

  get() async {
    final url = Uri.parse('https://fashion.betasayt.com/api/posts.php?lang=az');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var getResult = jsonDecode(response.body.toString());
      setState(() {
        statustext = getResult['status'];
        if (statustext == 'success') {
          posts = getResult['posts'];
        }
      });
    }
  }

  @override
  // ignore: must_call_super
  void initState() {
    get();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        color: Colors.red,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          setState(() {
            posts = [];
            get();
          });
        },
        child: (posts.isNotEmpty)
            ? ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return MainPost(
                      title: posts[index]['post_title'],
                      image: posts[index]['media_url']);
                })
            : SizedBox(
                height: 200.0,
                child: Center(child: CircularProgressIndicator())));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        ),
        debugShowCheckedModeBanner: false,
        title: 'EuroNewsTest',
        home: Scaffold(
          appBar: MyAppBar(),
          drawer: MyDrawer(),
          body: HomePage(),
        ));
  }
}
