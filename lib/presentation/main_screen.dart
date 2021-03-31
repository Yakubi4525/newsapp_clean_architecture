import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:news_cleaan_arch_bloc/domain/blocs/bottom_navbar_bloc.dart';
import 'package:news_cleaan_arch_bloc/presentation/screens/home_screen.dart';
import 'package:news_cleaan_arch_bloc/presentation/screens/search_screen.dart';
import 'package:news_cleaan_arch_bloc/presentation/screens/sources_screen.dart';
import 'package:news_cleaan_arch_bloc/presentation/styles/theme.dart' as Style;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomNavbarBloc _bottomNavBarBloc;
  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavbarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Style.Colors.mainColor,
          title: Text(
            "NewsApp",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return HomeScreen();
                break;
              case NavBarItem.SOURCES:
                return SourcesScreen();
                break;
              case NavBarItem.SEARCH:
                return SearchScreen();
                break;
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[100], spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                iconSize: 20,
                unselectedItemColor: Style.Colors.grey,
                unselectedFontSize: 10,
                selectedFontSize: 10,
                fixedColor: Style.Colors.mainColor,
                currentIndex: snapshot.data.index,
                onTap: _bottomNavBarBloc.pickItem,
                items: [
                  BottomNavigationBarItem(
                      title: Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text("Home",
                              style: TextStyle(fontWeight: FontWeight.w600))),
                      icon: Icon(EvaIcons.homeOutline),
                      activeIcon: Icon(EvaIcons.home),),
                  BottomNavigationBarItem(
                      title: Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text("Sources",
                              style: TextStyle(fontWeight: FontWeight.w600))),
                      icon: Icon(EvaIcons.gridOutline),
                      activeIcon: Icon(EvaIcons.grid),),
                  BottomNavigationBarItem(
                      title: Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text("Search",
                              style: TextStyle(fontWeight: FontWeight.w600))),
                      icon: Icon(EvaIcons.searchOutline),
                      activeIcon: Icon(EvaIcons.search),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
