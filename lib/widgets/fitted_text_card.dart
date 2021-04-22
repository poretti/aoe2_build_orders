import 'package:flutter/material.dart';

class FittedTextCard extends StatelessWidget {

  final String text;

  FittedTextCard(this.text);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyText1;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              text,
              style: textStyle?.apply(fontSizeFactor: 2),
            ),
          ),
        ),
      ),
    );
  }
}
