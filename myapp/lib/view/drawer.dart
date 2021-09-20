import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeftDrawerView extends StatelessWidget {
  const LeftDrawerView({Key? key}) : super(key: key);
  static const listTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w300
  );
  static const items = [
    ListTile(
      title: Text(
        'profile',
        style: listTextStyle,
      ),
      leading: FaIcon(FontAwesomeIcons.user, size: 20.0),
      horizontalTitleGap: 0.0
    ),
    ListTile(
      title: Text(
        'list',
        style: listTextStyle,
      ),
      leading: FaIcon(FontAwesomeIcons.list, size: 20.0),
      horizontalTitleGap: 0.0
    ),
    ListTile(
      title: Text(
        'book mark',
        style: listTextStyle,
      ),
      leading: FaIcon(FontAwesomeIcons.bookmark, size: 20.0),
      horizontalTitleGap: 0.0
    ),
    ListTile(
      title: Text(
        'moment',
        style: listTextStyle,
      ),
      leading: FaIcon(FontAwesomeIcons.bolt, size: 20.0),
      horizontalTitleGap: 0.0
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
        SizedBox(
          height: 200,
          width: double.infinity,
          child: DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  height: 56.0,
                  width: 56.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      image: AssetImage('res/image/user.png'),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              ),
              Text(
                'User Name',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '@acountId',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],),
          ),
        ),
        Expanded(
          child: ListView(
            children: items
          ),
        )
      ],
      )
    );
  }  
}
