import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(241, 244, 248, 10),
      elevation: 4.0,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Image.asset(
          'assets/images/app_bar_logo.png',
          scale: 3.0,
          fit: BoxFit.none,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
