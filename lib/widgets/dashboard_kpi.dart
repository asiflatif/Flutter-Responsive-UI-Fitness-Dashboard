import 'package:fitness_web_ui/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models.dart';

class GridItems extends StatelessWidget {
  const GridItems({Key key, this.crossAxisCount = 4, this.aspectRatio = 1}) : super(key: key);

  final int crossAxisCount;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    List<GridViewItems> gridviewItems = [
      GridViewItems("assets/images/running.png", "Steps per Week", "8000"),
      GridViewItems("assets/images/walking.png", "Walking distance", "12 mil"),
      GridViewItems("assets/images/heartrate.png", "Average Heart rate", "75"),
      GridViewItems("assets/images/goal.png", "Goals Completed", "4"),
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
                        height: 30,
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
                  gridviewItems[index].image,
                  height: 60,
                )
              ],
            ),
          );
        });
  }
}