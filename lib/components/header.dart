import 'package:fitness_web_ui/utils/MenuController.dart';
import 'package:fitness_web_ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../responsive.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                context.read<MenuController>().controlMenu();
              }),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        Expanded(
          child: SearchField(),
        ),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 15,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.white54)),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/icons/avatar.svg",
            height: 35,
            width: 35,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Ananta Jolil"),
            ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          suffixIcon: GestureDetector(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: SvgPicture.asset("assets/icons/search.svg",color: drawerTextColor,),
              padding: EdgeInsets.all(defaultPadding * 0.75),
              decoration:
                  BoxDecoration(color: primaryColor, borderRadius: const BorderRadius.all(Radius.circular(10)),),
            ),
          ),
          //fillColor: secondaryColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none, borderRadius: const BorderRadius.all(Radius.circular(10)))),
    );
  }
}
