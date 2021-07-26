import 'package:fitness_web_ui/components/dashboard.dart';
import 'package:fitness_web_ui/responsive.dart';
import 'package:fitness_web_ui/components/sideMenu.dart';
import 'package:fitness_web_ui/utils/MenuController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(Responsive.isDesktop(context))
            Expanded(child: SideMenu()),
          Expanded(child: Dashboard(),flex: 5,)
        ],
      ), ),
    );
  }
}
