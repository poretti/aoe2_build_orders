import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class GameContentUsageRules extends StatefulWidget {
  final String appName;

  GameContentUsageRules(this.appName);

  @override
  _GameContentUsageRulesState createState() =>
      _GameContentUsageRulesState(appName);
}

class _GameContentUsageRulesState extends State<GameContentUsageRules> {
  static const _rulesUrl = 'https://www.xbox.com/en-US/developers/rules';

  final String appName;

  _GameContentUsageRulesState(this.appName);

  // Idea taken from
  // https://api.flutter.dev/flutter/painting/TextSpan/recognizer.html
  // https://stackoverflow.com/questions/43583411/how-to-create-a-hyperlink-in-flutter-widget
  late TapGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = TapGestureRecognizer()..onTap = _handleTap;
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  void _handleTap() async {
    if (await canLaunch(_rulesUrl)) {
      await launch('https://www.xbox.com/en-US/developers/rules');
    } else {
      throw 'Could not launch $_rulesUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: RichText(
        text: TextSpan(
            text:
                'Age Of Empires II: Definitive Edition © Microsoft Corporation. $appName was created under Microsoft\'s "',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.apply(fontStyle: FontStyle.italic, fontSizeFactor: 0.85),
            children: <TextSpan>[
              TextSpan(
                  text: 'Game Content Usage Rules',
                  style: TextStyle(color: Colors.blue),
                  recognizer: _recognizer),
              TextSpan(
                  text:
                      '" using assets from Age Of Empires II: Definitive Edition, and it is not endorsed by or affiliated with Microsoft.'),
            ]),
      ),
    );
  }
}
