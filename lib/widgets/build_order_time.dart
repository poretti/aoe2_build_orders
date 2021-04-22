import 'package:flutter/material.dart';
import '../enums/age.dart';

class BuildOrderTime extends StatelessWidget {
  final String time;
  final Map<Age, int> ageEndPopCount;

  BuildOrderTime(this.time, this.ageEndPopCount);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.timer),
            Text(
              time,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.shield),
            Text(
              '${ageEndPopCount[Age.Dark]} / ${ageEndPopCount[Age.Feudal]}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}
