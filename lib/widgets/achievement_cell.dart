import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'expand_widget.dart';
import 'separator.dart';

/// ACHIEVEMENT CELL WIDGET
/// Widget used in SpaceX's achievement list, under the 'Home Screen'.
class AchievementCell extends StatelessWidget {
  final String title, subtitle, body, url;
  final int index;

  AchievementCell({
    @required this.title,
    @required this.subtitle,
    @required this.body,
    @required this.url,
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 16,
      ),
      title: Row(children: <Widget>[
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).textTheme.subhead.color,
          child: Text(
            '#$index',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
            ),
          ),
        ),
        Separator.spacer(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Separator.spacer(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.subhead),
            ],
          ),
        )
      ]),
      subtitle: Column(children: <Widget>[
        Separator.spacer(height: 8),
        TextExpand(text: body, maxLength: 5),
      ]),
      onTap: () async => await FlutterWebBrowser.openWebPage(
            url: url,
            androidToolbarColor: Theme.of(context).primaryColor,
          ),
    );
  }
}
