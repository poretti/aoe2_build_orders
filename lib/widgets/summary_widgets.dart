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

class TimeToCompleteWithHeader extends StatelessWidget {
  final String time;

  TimeToCompleteWithHeader(this.time);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Time to complete',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TimeToComplete(time),
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

class PopCountWithHeader extends StatelessWidget {
  final Map<Age, int> ageEndPopCount;

  PopCountWithHeader(this.ageEndPopCount);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Vil count (Dark|Feudal)',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        PopCount(ageEndPopCount),
      ],
    );
  }
}

class StepCount extends StatelessWidget {
  final Map<Age, int?> stepsPerAge;

  StepCount(this.stepsPerAge);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icon(Icons.list_alt_outlined),
        Icon(Icons.menu_book),
        Text(
          '${stepsPerAge[Age.Dark]} | ${stepsPerAge[Age.Feudal]}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}

class StepCountWithHeader extends StatelessWidget {
  final Map<Age, int?> stepsPerAge;

  StepCountWithHeader(this.stepsPerAge);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Steps (Dark|Feudal)',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        StepCount(stepsPerAge),
      ],
    );
  }
}
