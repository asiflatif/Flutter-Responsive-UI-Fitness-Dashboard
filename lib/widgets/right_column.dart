import 'package:fitness_web_ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models.dart';

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
