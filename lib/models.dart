import 'package:flutter/cupertino.dart';

class CalorieList {
  final String svgSource, title, subtitle;

  CalorieList(this.svgSource, this.title, this.subtitle);
}

class GridViewItems {
  final String image, title, buttonLabel;

  GridViewItems(this.image, this.title, this.buttonLabel);
}

class GoalItems {
  final double percentage;
  final IconData icon;
  final String label, percentageCompleted, goals, leftThisWeek, completed;

  GoalItems(this.percentage, this.icon, this.label, this.percentageCompleted, this.goals, this.leftThisWeek,
      this.completed);
}

class ChartData {
  ChartData(this.x, this.high, this.low);

  final String x;
  final double high, low;
}

class PieData {
  PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}