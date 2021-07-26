import 'package:fitness_web_ui/components/header.dart';
import 'package:fitness_web_ui/utils/constants.dart';
import 'package:flutter/material.dart';

import '../responsive.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Header(),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Responsive(
                      mobile: GridItems(
                        crossAxisCount: _size.width < 650 ? 2 : 4,
                        aspectRatio: _size.width < 650 ? 1.3 : 1,
                      ),
                      desktop: GridItems(
                        aspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                      ),
                      tablet: GridItems(),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Container(
                      padding: EdgeInsets.all(defaultPadding),
                      decoration:
                      BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10)),
                      height: 500,
                    ),
                    if (Responsive.isMobile(context))
                      SizedBox(
                        height: defaultPadding,
                      ),
                    if (Responsive.isMobile(context))
                      Container(
                        padding: EdgeInsets.all(defaultPadding),
                        height: 500,
                        decoration:
                        BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [],
                        ),
                      )
                  ],
                ),
                flex: 5,
              ),
              if (!Responsive.isMobile(context))
                SizedBox(
                  width: defaultPadding,
                ),
              if (!Responsive.isMobile(context))
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    height: 500,
                    decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                      ],
                    ),
                  ),
                  flex: 2,
                )
            ],
          )
        ],
      ),
    ));
  }
}

class GridItems extends StatelessWidget {
  const GridItems(
      {Key key, this.files = const ['', '', '', ''], this.crossAxisCount = 4, this.aspectRatio = 1.4})
      : super(key: key);
  final List<String> files;

  final int crossAxisCount;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, crossAxisSpacing: defaultPadding,mainAxisSpacing: defaultPadding, childAspectRatio: aspectRatio),
        itemCount: files.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(defaultPadding*0.75),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(10),boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(1, 1),
              ),
            ],),
            height: 200,
          );
        });
  }
}