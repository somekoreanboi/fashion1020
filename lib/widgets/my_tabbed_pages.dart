import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fashion1020/managers/auth_manager.dart';
import 'package:fashion1020/screens/my_profile_screen.dart';
import 'package:fashion1020/screens/notification_screen.dart';
import 'package:fashion1020/screens/post_screen.dart';
import 'package:fashion1020/screens/search_screen.dart';
import 'package:fashion1020/screens/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MyTabbedPages extends StatefulWidget {
  @override
  _MyTabbedPagesState createState() => _MyTabbedPagesState();
}

class _MyTabbedPagesState extends State<MyTabbedPages>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  PageController _myPageController = PageController(
    initialPage: 0,
  );
  final myItems = [
    TabItem(
      icon: FaIcon(
        FontAwesomeIcons.home,
        color: Colors.white,
      ),
      title: '홈',
    ),
    TabItem(
      icon: FaIcon(
        FontAwesomeIcons.search,
        color: Colors.white,
      ),
      title: '검색',
    ),
    TabItem(
      icon: Icons.add,
      title: '업로드',
    ),
    TabItem(
      icon: FaIcon(
        FontAwesomeIcons.bell,
        color: Colors.white,
      ),
      title: '알림',
    ),
    TabItem(
      icon: FaIcon(
        FontAwesomeIcons.userCog,
        color: Colors.white,
      ),
      title: '내 프로필',
    ),
  ];

  final List<Widget> myTabs = <Widget>[
    ViewScreen(),
    SearchScreen(),
    PostScreen(),
    NotificationScreen(),
    MyProfileScreen(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthManager(),
      child: Scaffold(
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.fixedCircle,
            backgroundColor: Colors.black,
            onTap: (int i) {
              setState(
                () {
                  _myPageController.animateToPage(i,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
              );
            },
            controller: _tabController,
            items: myItems,
          ),
          body: PageView(
            controller: _myPageController,
            onPageChanged: (newIndex) {
              setState(
                () {
                  _currentIndex = newIndex;
                },
              );
            },
            physics: NeverScrollableScrollPhysics(),
            children: myTabs,
          )),
    );
  }
}
