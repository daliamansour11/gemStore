import 'package:flutter/material.dart';
import '../../../../core/resources/assets_manger.dart';
import '../../../../core/resources/strings_manger.dart';
import '../widget/home_body.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _appBarBody(),
      backgroundColor: Colors.white,
      body: const HomeBody()
    );
  }

  _appBarBody() {
    return  AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true, // Center title
      title: const Text(
        AppString.homeAppBar,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: InkWell(
          onTap: () {
            setState(() {
              Scaffold.of(context).openDrawer();

            });
          },
          child: Image.asset(
            ImageAssets.menu,
          )),
    );
  }



}
