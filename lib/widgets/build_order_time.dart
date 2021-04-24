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
        TimeToComplete(time),
        PopCount(ageEndPopCount),
      ],
    );
  }
}

class TimeToComplete extends StatelessWidget {
  final String time;

  TimeToComplete(this.time);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.timer),
        Text(
          time,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

class PopCount extends StatelessWidget {
  final Map<Age, int> ageEndPopCount;

  PopCount(this.ageEndPopCount);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shield),
        Text(
          '${ageEndPopCount[Age.Dark]} | ${ageEndPopCount[Age.Feudal]}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
