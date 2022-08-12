import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(20.0), // height of appbar
        child: AppBar(
          backgroundColor: const Color(0xFF015486),
          title: SvgPicture.asset('assets/images/logo.svg',
              width: 170.0, height: 25.0, fit: BoxFit.contain),
          centerTitle: true,
        ));
  }
}
