import 'package:flutter/material.dart';
import '../theme_data.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        width: 200,
        child: ElevatedButton(
          // Only enable button when this build step is completed.
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return ColorsExt.polishedPine.withOpacity(0.2);
              } else {
                return ColorsExt.polishedPine;
              }
            }),
          ),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
