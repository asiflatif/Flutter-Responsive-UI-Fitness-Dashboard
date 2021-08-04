import 'package:fitness_web_ui/homepage.dart';
import 'package:fitness_web_ui/utils/MenuController.dart';
import 'package:fitness_web_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyFitness',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: drawerTextColor,
        ),
        //textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        primarySwatch: Colors.blue,
      ),

      home: MultiProvider(
          providers: [ChangeNotifierProvider(create: (context) => MenuController())], child: HomePage()),
    );
  }
}
