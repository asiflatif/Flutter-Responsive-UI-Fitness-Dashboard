import 'package:fitness_web_ui/widgets/dashboard_kpi.dart';
import 'package:fitness_web_ui/widgets/header.dart';
import 'package:fitness_web_ui/utils/constants.dart';
import 'package:fitness_web_ui/widgets/dashboard_body_header.dart';
import 'package:fitness_web_ui/widgets/goal_cards.dart';
import 'package:fitness_web_ui/widgets/right_column.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models.dart';
import '../utils/responsive.dart';
import '../utils/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    List<GoalItems> goalsItems = [
      GoalItems(0.5, Icons.directions_bike, "Bicycle", "50%", "36 Km / week", "3 days left", "17 km"),
      GoalItems(0.3, Icons.directions_run, "Jogging", "30%", "8000 steps \n/ day", "2 days left",
          "3600 steps"),
      GoalItems(0.8, Icons.flag, "My Goals", "80%", "8 goals / week", "4 days left", "4 goals"),
    ];
    List <Widget> widgetList = [

    ];
    return SafeArea(
        child: SingleChildScrollView(
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
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DashboardBodyHeader(
                            label: "My Goals",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: goalsItems.length,
                            itemBuilder: (context, index) {
                              return GoalCards(
                                percent: goalsItems[index].percentage,
                                icon: goalsItems[index].icon,
                                label: goalsItems[index].label,
                                percentageCompleted: goalsItems[index].percentageCompleted,
                                goal: goalsItems[index].goals,
                                leftThisWeek: goalsItems[index].leftThisWeek,
                                completed: goalsItems[index].completed,
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    Responsive(mobile: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DashboardBodyHeader(
                                label: "Daily Activity",
                              ),
                              Container(
                                  child: SfCircularChart(
                                      legend: Legend(isVisible: true),
                                      series: <CircularSeries<PieData, String>>[
                                        DoughnutSeries<PieData, String>(
                                          explode: true,
                                          explodeIndex: 0,
                                          dataSource: [
                                            PieData("Stamina", 40),
                                            PieData("Cardio", 20),
                                            PieData("Strength", 30),
                                            PieData("Stretching", 10)
                                          ],
                                          xValueMapper: (PieData data, _) => data.xData,
                                          yValueMapper: (PieData data, _) => data.yData,
                                        ),
                                      ])),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        Container(
                          padding: EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DashboardBodyHeader(
                                label: "Your Trainers",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    "assets/icons/coach1.svg",
                                    height: 35,
                                    width: 35,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 5,
                                        blurRadius: 15,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text(
                                  "Dwayne Johnson",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "Wrestling Coach",
                                  style: TextStyle(fontSize: 12),
                                ),
                                trailing: Icon(
                                  Icons.message_rounded,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: Container(
                                  padding: EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    "assets/icons/coach2.svg",
                                    height: 35,
                                    width: 35,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 5,
                                        blurRadius: 15,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                ),
                                title: Text(
                                  "Mike Tyson",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "Boxing Coach",
                                  style: TextStyle(fontSize: 12),
                                ),
                                trailing: Icon(
                                  Icons.message_rounded,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                      desktop: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DashboardBodyHeader(
                                  label: "Daily Activity",
                                ),
                                Container(
                                    child: SfCircularChart(
                                        legend: Legend(isVisible: true),
                                        series: <CircularSeries<PieData, String>>[
                                          DoughnutSeries<PieData, String>(
                                            explode: true,
                                            explodeIndex: 0,
                                            dataSource: [
                                              PieData("Stamina", 40),
                                              PieData("Cardio", 20),
                                              PieData("Strength", 30),
                                              PieData("Stretching", 10)
                                            ],
                                            xValueMapper: (PieData data, _) => data.xData,
                                            yValueMapper: (PieData data, _) => data.yData,
                                          ),
                                        ])),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: defaultPadding,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(defaultPadding),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                DashboardBodyHeader(
                                  label: "Your Trainers",
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  leading: Container(
                                    padding: EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      "assets/fruits/apple.svg",
                                      height: 35,
                                      width: 35,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 5,
                                          blurRadius: 15,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Text(
                                    "Dwayne Johnson",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "Wrestling Coach",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  trailing: Icon(
                                    Icons.message_rounded,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  leading: Container(
                                    padding: EdgeInsets.all(10),
                                    child: SvgPicture.asset(
                                      "assets/fruits/apple.svg",
                                      height: 35,
                                      width: 35,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 5,
                                          blurRadius: 15,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  title: Text(
                                    "Dwayne Johnson",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "Wrestling Coach",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  trailing: Icon(
                                    Icons.message_rounded,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),),

                    if (Responsive.isMobile(context))
                      SizedBox(
                        height: defaultPadding,
                      ),
                    if (Responsive.isMobile(context)) RightColumn()
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
                  child: RightColumn(),
                  flex: 2,
                )
            ],
          )
        ],
      ),
    ));
  }
}


