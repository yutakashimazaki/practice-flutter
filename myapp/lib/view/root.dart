import 'package:flutter/material.dart';
import 'package:myapp/view/home.dart';
import 'package:myapp/view/search.dart';
import 'package:myapp/view/notification.dart';
import 'package:myapp/view/message.dart';
import 'package:myapp/view/drawer.dart';

// TODO StatlessにしてProviderパターンで実装する
class RootView extends StatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  RootViewState createState() => RootViewState();
}

class RootViewState extends State<RootView> {
  int _selectedIndex = 0;
  PageController? _pageController;

  static const List<BottomNavigationBarItem> _tabBarItems = [
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

  static const List<Widget> _views = [
    HomeView(),
    SearchView(),
    NotificationView(),
    MessageView(),
  ];

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
        items: _tabBarItems,
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
          // TODO テキスト入力のモーダルを表示
        },
        child: const Icon(Icons.edit_outlined),
      )
    );
  }  
}
