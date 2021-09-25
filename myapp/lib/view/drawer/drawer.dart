import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/view/drawer/book_mark.dart';
import 'package:myapp/view/drawer/list.dart';
import 'package:myapp/view/drawer/moment.dart';
import 'package:myapp/view/drawer/profile.dart';
import 'package:myapp/extension/extension_widget.dart';

class LeftDrawerView extends StatelessWidget {
  const LeftDrawerView({Key? key}) : super(key: key);
  static const listTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w300
  );

  List<ListTile> drawerList(BuildContext context) {
    return [
      ListTile(
        title: Text(
          l10n(context).label_drawer_profile_title,
          style: listTextStyle,
        ),
        leading: const FaIcon(FontAwesomeIcons.user, size: 20.0),
        horizontalTitleGap: 0.0,
        onTap: () => drawerNavigation(context, DrawerForwardingIndex.profile),
      ),
      ListTile(
        title: Text(
          l10n(context).label_drawer_list_title,
          style: listTextStyle,
        ),
        leading: const FaIcon(FontAwesomeIcons.list, size: 20.0),
        horizontalTitleGap: 0.0,
        onTap: () => drawerNavigation(context, DrawerForwardingIndex.list),
      ),
      ListTile(
        title: Text(
          l10n(context).label_drawer_bookmark_title,
          style: listTextStyle,
        ),
        leading: const FaIcon(FontAwesomeIcons.bookmark, size: 20.0),
        horizontalTitleGap: 0.0,
        onTap: () => drawerNavigation(context, DrawerForwardingIndex.bookMark),
      ),
      ListTile(
        title: Text(
          l10n(context).label_drawer_moment_title,
          style: listTextStyle,
        ),
        leading: const FaIcon(FontAwesomeIcons.bolt, size: 20.0),
        horizontalTitleGap: 0.0,
        onTap: () => drawerNavigation(context, DrawerForwardingIndex.moment),
      ),
    ];
  } 

  void drawerNavigation(BuildContext context, DrawerForwardingIndex index) {
    Widget forwardingView = const ProfileView();
    switch (index) {
      case DrawerForwardingIndex.profile:
        break;
      case DrawerForwardingIndex.list:
        forwardingView = const MyListView();
        break;
      case DrawerForwardingIndex.bookMark:
        forwardingView = const BookMarkView();
        break;
      case DrawerForwardingIndex.moment:
        forwardingView = const MomentView();
        break;
      default:
       break;
    }
    Navigator.push(
      context, MaterialPageRoute(
        builder: (context) => forwardingView
      )
    );
  }

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
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('res/image/user.png'),
                ),
              ),
              Text(
                'User Name', // TODO ラベルではなくセッションから取得
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                '@acountId', // TODO ラベルではなくセッションから取得
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],),
          ),
        ),
        Expanded(
          child: ListView(
            children: drawerList(context)
          ),
        )
      ],
      )
    );
  }  
}
enum DrawerForwardingIndex {
  profile,
  list,
  bookMark,
  moment
}
