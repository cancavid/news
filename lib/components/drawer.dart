import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/drawer_bg.jpg"),
                  fit: BoxFit.cover),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
              ),
            ),
          ),
          MyDrawerTile(text: 'Parametrlər', icon: Icons.settings),
          MyDrawerTile(text: 'Haqqımızda', icon: Icons.supervised_user_circle),
          MyDrawerTile(text: 'Bizimlə əlaqə', icon: Icons.phone),
          MyDrawerTile(text: 'Rəyləriniz', icon: Icons.comment),
          MyDrawerTile(text: 'Bizi qiymətləndirin', icon: Icons.star)
        ],
      ),
    );
  }
}

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData icon;

  const MyDrawerTile({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(icon, color: Colors.black),
      onTap: () {},
    );
  }
}
