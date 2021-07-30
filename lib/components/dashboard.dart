import 'package:fitness_web_ui/components/header.dart';
import 'package:fitness_web_ui/utils/constants.dart';
import 'package:fitness_web_ui/widgets/DashboardBodyHeader.dart';
import 'package:fitness_web_ui/widgets/goal_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../responsive.dart';
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
                        aspectRatio: _size.width < 650 ? 0.9 : 0.6,
                      ),
                      desktop: GridItems(
                        aspectRatio: _size.width < 1400 ? 0.7 : 0.95,
                      ),
                      // tablet: GridItems(
                      //   aspectRatio: _size.width < 1100 ? 0.9 : 0.9,
                      // ),
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
                          GoalCards(
                            percent: 0.8,
                            icon: Icons.directions_bike,
                            label: "Bicycle Drill",
                            percentageCompleted: "80%",
                            goal: "36 Km / week",
                            leftThisWeek: "2 days left",
                            completed: "17 km",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GoalCards(
                            percent: 0.5,
                            icon: Icons.directions_run,
                            label: "Jogging Hero",
                            percentageCompleted: "80%",
                            goal: "36 Km / week",
                            leftThisWeek: "2 days left",
                            completed: "17 km",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GoalCards(
                            percent: 0.9,
                            icon: Icons.directions_bike,
                            label: "Bicycle Drill",
                            percentageCompleted: "80%",
                            goal: "36 Km / week",
                            leftThisWeek: "2 days left",
                            completed: "17 km",
                          )
                        ],
                      ),
                    ),
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

class RightColumn extends StatelessWidget {
  const RightColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CalorieList> calorieList = [
      CalorieList("assets/fruits/apple.svg", "Apple", "45"),
      CalorieList("assets/fruits/banana.svg", "Banana", "80"),
      CalorieList("assets/fruits/apricot.svg", "Apricot", "17"),
      CalorieList("assets/fruits/blueberry.svg", "Blueberries", "51"),
      CalorieList("assets/fruits/carrot.svg", "Carrot", "78"),
      CalorieList("assets/fruits/strawberry.svg", "Strawberry", "37"),
      CalorieList("assets/fruits/grapes.svg", "Grapes", "66"),
    ];
    return Container(
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Heart Rate", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Container(
                padding: EdgeInsets.all(10),
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
                child: Icon(Icons.menu),
              )
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "+1.50%",
                          style: Theme.of(context).textTheme.bodyText1.apply(color: TextColor),
                        ),
                        Text(
                          "Stats",
                          style: Theme.of(context).textTheme.headline5.apply(color: Colors.white),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Text(
                            "Month",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    )
                  ],
                ),
                SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryYAxis: NumericAxis(
                        isVisible: false,
                        majorGridLines: MajorGridLines(width: 0),
                        axisLine: AxisLine(width: 0)),
                    primaryXAxis:
                        CategoryAxis(majorGridLines: MajorGridLines(width: 0), axisLine: AxisLine(width: 0)),
                    series: <RangeColumnSeries>[
                      RangeColumnSeries<ChartData, String>(
                        dataSource: <ChartData>[
                          ChartData('Sun', 60, 80),
                          ChartData('Mon', 55, 75),
                          ChartData('Tue', 60, 90),
                          ChartData('Wed', 60, 117),
                          ChartData('Thu', 55, 120),
                          ChartData('Fri', 50, 85),
                          ChartData('Sat', 58, 75),
                        ],
                        color: Colors.white,
                        width: 0.5,
                        borderRadius: BorderRadius.circular(defaultPadding - 5),
                        xValueMapper: (ChartData sales, _) => sales.x,
                        lowValueMapper: (ChartData sales, _) => sales.low,
                        highValueMapper: (ChartData sales, _) => sales.high,
                      )
                    ]),
              ],
            ),
            padding: EdgeInsets.all(defaultPadding),
            margin: EdgeInsets.only(bottom: defaultPadding),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: drawerTextColor),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Calories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Container(
              padding: EdgeInsets.all(10),
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
              child: Icon(Icons.menu),
            )
          ]),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(top: defaultPadding),
              padding: EdgeInsets.all(defaultPadding),
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: calorieList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        calorieList[index].svgSource,
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
                      calorieList[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Calories: " + calorieList[index].subtitle,
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: Icon(Icons.chevron_right),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey.withOpacity(0.2),
                  );
                },
              ))
        ],
      ),
    );
  }
}

class GridItems extends StatelessWidget {
  const GridItems({Key key, this.crossAxisCount = 4, this.aspectRatio = 1}) : super(key: key);

  final int crossAxisCount;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    List<GridViewItems> gridviewItems = [
      GridViewItems(Image.asset("name"), "Steps per Week", "8000"),
      GridViewItems(Image.asset("name"), "Walking distance", "12 mil"),
      GridViewItems(Image.asset("name"), "Average Heart rate", "75"),
      GridViewItems(Image.asset("name"), "Goals Completed", "4"),
    ];
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: defaultPadding,
            childAspectRatio: aspectRatio),
        itemCount: gridviewItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 90,
                      ),
                      Text(
                        gridviewItems[index].title,
                        style: TextStyle(color: TextColor, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            gridviewItems[index].buttonLabel,
                            style:
                                TextStyle(fontSize: 20, color: drawerTextColor, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/nav_img.png",
                  height: Responsive.isDesktop(context) ? 140 : 120,
                )
              ],
            ),
          );
        });
  }
}

class CalorieList {
  final String svgSource;
  final String title;
  final String subtitle;

  CalorieList(this.svgSource, this.title, this.subtitle);
}

class GridViewItems {
  final Image image;
  final String title;
  final String buttonLabel;

  GridViewItems(this.image, this.title, this.buttonLabel);
}

class ChartData {
  ChartData(this.x, this.high, this.low);

  final String x;
  final double high;
  final double low;
}
