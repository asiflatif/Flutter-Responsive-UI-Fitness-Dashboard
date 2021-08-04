import 'package:fitness_web_ui/utils/responsive.dart';
import 'package:fitness_web_ui/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalCards extends StatelessWidget {
  const GoalCards(
      {Key key,
      this.icon,
      this.label,
      this.percentageCompleted,
      this.goal,
      this.leftThisWeek,
      this.completed,
      this.percent})
      : super(key: key);
  final double percent;
  final IconData icon;
  final String label, percentageCompleted, goal, leftThisWeek, completed;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        if (!Responsive.isMobile(context))
          Container(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(defaultPadding)),
            height: 120,
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    percentageCompleted,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text(
                    goal,
                    style: TextStyle(color: TextColor),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        Container(
            padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: defaultPadding, bottom: defaultPadding),
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Flexible(
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.only(left: defaultPadding, top: 5),
                        width: _size.width * 0.3,
                        animation: true,
                        lineHeight: 10.0,
                        animationDuration: 2500,
                        percent: percent,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.green,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: defaultPadding),
                        child: Text(
                          completed,
                          style: TextStyle(color: TextColor),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            leftThisWeek,
                            style: TextStyle(color: Colors.pink, fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink[100],
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, 3),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(defaultPadding)),
            height: 120,
            margin: EdgeInsets.only(right: Responsive.isMobile(context) ? 0 : 120, left: 20)),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: drawerTextColor,
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
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
