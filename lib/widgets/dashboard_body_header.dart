import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardBodyHeader extends StatelessWidget {
  const DashboardBodyHeader({Key key, this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
    );
  }
}
