import 'package:flutter/material.dart';
import 'package:myapp/view/root/home.dart';
import 'package:myapp/view/root/modal.dart';
import 'package:myapp/view/root/search.dart';
import 'package:myapp/view/root/notification.dart';
import 'package:myapp/view/root/message.dart';
import 'package:myapp/view/drawer/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// TODO StatlessにしてProviderパターンで実装する
class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  RootViewState createState() => RootViewState();
}

class RootViewState extends State<RootView> {
  int _selectedIndex = 0;
  PageController? _pageController;

  static const List<Widget> _views = [
    HomeView(),
    SearchView(),
    NotificationView(),
    MessageView(),
  ];

  // TODO StatelessWedgetにしたタイミングでlabelもl10nする
  // Statelessにする想定なのでStateのextensionではあえてやらない
  List<BottomNavigationBarItem> tabBarItems(BuildContext context) {
    return const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search_outlined),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications_outlined),
        label: 'Notification',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.mail_outlined),
        label: 'Message',
      ),
    ];
  }

  void onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
            controller: _pageController,
            onPageChanged: onTap,
            children: _views
      ),
      drawer: const LeftDrawerView(),
      bottomNavigationBar: BottomNavigationBar(
        items: tabBarItems(context),
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        showSelectedLabels: false,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: false,
        iconSize: 28.0,
        onTap: (index) {
          _selectedIndex = index;
          _pageController?.animateToPage(index,
              duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => const ModalView(),
              fullscreenDialog: true,
            )
          );
        },
        child: const FaIcon(FontAwesomeIcons.featherAlt, size: 22.0),
      )
    );
  }  
}
