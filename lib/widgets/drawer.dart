import 'package:fitness_web_ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<RadialChartData> chartData = <RadialChartData>[
      RadialChartData('Calories', 75, const Color.fromRGBO(235, 97, 143, 1)),
      RadialChartData('Steps', 80, const Color.fromRGBO(145, 132, 202, 1)),
      RadialChartData('SpO2', 98, const Color.fromRGBO(69, 187, 161, 1)),
    ];
    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              child: ConstrainedBox(
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: SafeArea(
                    child: Column(
                      children: [
                        Column(
                          children: <Widget>[

                            DrawerHeader(
                                child: Container(
                                    child: SfCircularChart(
                                        legend: Legend(isVisible: true, position: LegendPosition.bottom,overflowMode: LegendItemOverflowMode.wrap),
                                        series: <CircularSeries<RadialChartData, String>>[
                                  RadialBarSeries<RadialChartData, String>(
                                    enableTooltip: true,
                                      maximumValue: 100,
                                      radius: '100%',
                                      gap: '10%',
                                      dataSource: chartData,
                                      cornerStyle: CornerStyle.bothCurve,
                                      xValueMapper: (RadialChartData data, _) => data.x,
                                      yValueMapper: (RadialChartData data, _) => data.y,
                                      pointColorMapper: (RadialChartData data, _) => data.color)
                                ]))),
                            DrawerListTile(
                              opacityGrade: 1.0,
                              title: "Activity",
                              svgSrc: "assets/icons/activity.svg",
                              press: () {},
                            ),
                            DrawerListTile(
                              title: "BMI",
                              svgSrc: "assets/icons/bmi.svg",
                              press: () {},
                            ),
                            DrawerListTile(
                              title: "Heart",
                              svgSrc: "assets/icons/heart.svg",
                              press: () {},
                            ),
                            DrawerListTile(
                              title: "Sleep",
                              svgSrc: "assets/icons/sleep.svg",
                              press: () {},
                            ),
                            DrawerListTile(
                              title: "Goals",
                              svgSrc: "assets/icons/goals.svg",
                              press: () {},
                            ),
                            DrawerListTile(
                              title: "Workout",
                              svgSrc: "assets/icons/workout.svg",
                              press: () {},
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/nav_img.png",
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Change dashboard settings from here",
                                  style: TextStyle(color: TextColor, fontSize: 12.0),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Settings"),
                                  style: ElevatedButton.styleFrom(
                                    primary: drawerTextColor,
                                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                                    elevation: 10,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({Key key, this.title, this.svgSrc, this.press, this.opacityGrade = 0.5})
      : super(key: key);
  final String title, svgSrc;
  final double opacityGrade;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacityGrade,
      child: ListTile(
        onTap: press,
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          svgSrc,
          color: drawerTextColor,
          height: 16,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class RadialChartData {
  RadialChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}
